import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/utils/paginatin_state.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/features/top_anime/model/top_anime_model/media.dart';
import 'package:otaku_scope/features/top_anime/model/top_anime_model/top_anime_model.dart';
import 'package:otaku_scope/features/top_anime/repo/top_anime_repo.dart';

class TopAnimeNotifier extends StateNotifier<PaginatedState<Media>> {
  final TopAnimeRepo repo;

  TopAnimeNotifier(this.repo) : super(PaginatedState.initial());

  Future<void> loadFirstPage() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, error: null, currentPage: 0, hasNextPage: true, items: null);
    final result = await repo.fetchTopAnime(page: 1);
    result.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          items: data.data!.page!.media,
          
          currentPage: data.data!.page!.pageInfo!.currentPage,
          hasNextPage: data.data!.page!.pageInfo!.hasNextPage,
        );
      },
      failure: (f) {
        state = state.copyWith(isLoading: false, error: f.toString());
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasNextPage) return;
    state = state.copyWith(isLoadingMore: true, error: null);
    final nextPage = state.currentPage + 1;
    final result = await repo.fetchTopAnime(page: nextPage);
    result.when(
      success: (data) {
        state = state.copyWith(
          isLoadingMore: false,
          items: [...?state.items, ...?data.data!.page!.media],
          currentPage: data.data!.page!.pageInfo!.currentPage,
          hasNextPage:  data.data!.page!.pageInfo!.hasNextPage,
        );
      },
      failure: (f) {
        state = state.copyWith(isLoadingMore: false, error: f.toString());
      },
    );
  }

  Future<void> refresh() async {
    await loadFirstPage();
  }
}
