import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/errors/failure.dart';
import 'package:otaku_scope/core/models/media.dart';
import 'package:otaku_scope/core/utils/paginatin_state.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/features/search/repo/search_repo.dart';

class SearchController extends StateNotifier<PaginatedState<Media>> {
  final SearchRepo _repo;
  String _currentQuery = '';

  DateTime _lastLoadAt = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime? _nextAllowedRequestAt;
  static const Duration _minIntervalBetweenLoads = Duration(milliseconds: 600);

  SearchController(this._repo) : super(PaginatedState.initial<Media>());

  void setQuery(String query) {
    final normalized = query.trim();
    if (normalized == _currentQuery) return;
    _currentQuery = normalized;
    refresh();
  }

  Future<void> loadFirstPage() async {
    if (state.isLoading || state.isLoadingMore) return;
    _nextAllowedRequestAt = null;
    state = state.copyWith(isLoading: true, error: null);

    if (_currentQuery.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        items: const [],
        currentPage: 0,
        hasNextPage: false,
      );
      return;
    }

    final result = await _repo.fetchSearch(search: _currentQuery, page: 1);
    result.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          items: data.page?.media ?? const [],
          currentPage: data.page?.pageInfo?.currentPage ?? 1,
          hasNextPage: data.page?.pageInfo?.hasNextPage ?? false,
        );
        _lastLoadAt = DateTime.now();
      },
      failure: (f) {
        state = state.copyWith(isLoading: false, error: f);
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoading || state.isLoadingMore || !state.hasNextPage) return;
    if (_currentQuery.isEmpty) return;

    final now = DateTime.now();
    if (_nextAllowedRequestAt != null && now.isBefore(_nextAllowedRequestAt!)) {
      return;
    }
    if (now.difference(_lastLoadAt) < _minIntervalBetweenLoads) {
      return;
    }

    state = state.copyWith(isLoadingMore: true);

    final nextPage = (state.currentPage) + 1;
    final result = await _repo.fetchSearch(search: _currentQuery, page: nextPage);
    result.when(
      success: (data) {
        final current = state.items;
        final incoming = data.page?.media ?? const [];
        final seen = <int>{for (final m in current) if (m.id != null) m.id!};
        final merged = <Media>[...current];
        for (final m in incoming) {
          final id = m.id;
          if (id != null && !seen.contains(id)) {
            seen.add(id);
            merged.add(m);
          }
        }

        state = state.copyWith(
          isLoadingMore: false,
          items: merged,
          currentPage: data.page?.pageInfo?.currentPage ?? nextPage,
          hasNextPage: data.page?.pageInfo?.hasNextPage ?? false,
        );
        _lastLoadAt = DateTime.now();
      },
      failure: (f) {
        if (f is ServerFailure && f.statusCode == 429) {
          _nextAllowedRequestAt = DateTime.now().add(const Duration(seconds: 15));
        }
        state = state.copyWith(isLoadingMore: false, error: null);
      },
    );
  }

  Future<void> refresh() async {
    await loadFirstPage();
  }
}


