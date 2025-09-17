




import 'dart:developer';

import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/errors/failure.dart';
import 'package:otaku_scope/core/models/media.dart';
import 'package:otaku_scope/core/utils/paginatin_state.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/features/last_update_manga/repo/Last_update_manga_repo.dart';

class LastUpdateMangaController extends StateNotifier<PaginatedState<Media>> {
  final  LastUpdateMangaRepo _repo;
  DateTime _lastLoadAt = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime? _nextAllowedRequestAt;
  static const Duration _minIntervalBetweenLoads = Duration(seconds: 1);

  // FIX: This line is CRITICAL. It must call the stati%%%%c generic factory.
  LastUpdateMangaController(this._repo,) : super(PaginatedState.initial<Media>());

  Future<void> loadFirstPage() async {
    if (state.isLoading || state.isLoadingMore) return;
    _nextAllowedRequestAt = null;
    // This line will now work because `state` is PaginatedState<Media>
    state = state.copyWith(isLoading: true, error: null); 

    final result = await _repo.fetchLastUpdateManga(page: 1);
    result.when(
      success: (data) {
       log("data from provider ${data.toString()}");
        // Ensure unique items by id on first page as well
        final incoming = data.page?.media ?? const [];
        final seen = <int>{};
        final unique = <Media>[];
        for (final m in incoming) {
          final id = m.id;
          if (id != null && !seen.contains(id)) {
            seen.add(id);
            unique.add(m);
          }
        }
        state = state.copyWith(
          isLoading: false,
          items: unique,
          currentPage: data.page?.pageInfo?.currentPage ?? 1,
          hasNextPage: data.page?.pageInfo?.hasNextPage ?? false,
        );
        _lastLoadAt = DateTime.now();
      },
      failure: (f) {
        state = state.copyWith(isLoading: false, error: f.toString());
      },
    );
  }

  Future<void> loadMore() async {
    final now = DateTime.now();
    if (_nextAllowedRequestAt != null && now.isBefore(_nextAllowedRequestAt!)) {
      return;
    }
    if (now.difference(_lastLoadAt) < _minIntervalBetweenLoads) {
      return;
    }
    if (state.isLoading || state.isLoadingMore || !state.hasNextPage) {
      return;
    }
    await Future.delayed(const Duration(milliseconds: 250));
    state = state.copyWith(isLoadingMore: true, error: null);

    // Calculate the next page value
    final nextPage = (state.currentPage) + 1;

    final result = await _repo.fetchLastUpdateManga(
      page: nextPage,
    );
    result.when(
      success: (data) {
        // Merge with de-duplication by id
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
        // Do not surface pagination errors to the full-screen UI
        // If rate limited, set a cooldown window before next request
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
