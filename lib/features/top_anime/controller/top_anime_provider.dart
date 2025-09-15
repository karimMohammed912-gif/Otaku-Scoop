import 'dart:developer' as dev;

import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/utils/enums.dart';
import 'package:otaku_scope/core/utils/paginatin_state.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/features/top_anime/model/top_anime_model/media.dart';
import 'package:otaku_scope/features/top_anime/repo/top_anime_repo.dart';





class TopAnimeNotifier extends StateNotifier<PaginatedState<Media>> {
  final TopAnimeRepo _repo;
  final TopAnimeCategory _category;

  // FIX: This line is CRITICAL. It must call the stati%%%%c generic factory.
  TopAnimeNotifier(this._repo, this._category) : super(PaginatedState.initial<Media>());

  Future<void> loadFirstPage() async {
    if (state.isLoading) return;
    // This line will now work because `state` is PaginatedState<Media>
    state = state.copyWith(isLoading: true, error: null); 

    final result = await _repo.fetchTopAnime(page: 1, category: _category);
    result.when(
      success: (data) {
        dev.log("data from provider ${data.toString()}");
        state = state.copyWith(
          isLoading: false,
          items: data.page?.media,
          currentPage: data.page?.pageInfo?.currentPage,
          hasNextPage: data.page?.pageInfo?.hasNextPage,
        );
      },
      failure: (f) {
        state = state.copyWith(isLoading: false, error: f.toString());
      },
    );
  }

  Future<void> loadMore() async {
   await Future.delayed(const Duration(microseconds: 2500));

    state = state.copyWith(isLoadingMore: true, error: null);
    final nextPage = (state.currentPage) + 1;

    // FIX: Pass the category to the repository method
    final result = await _repo.fetchTopAnime(
      page: nextPage,
      category: _category,
    );
    result.when(
      success: (data) {
        state = state.copyWith(
          isLoadingMore: false,
          items: [...state.items, ...?data.page?.media],
          currentPage: data.page?.pageInfo?.currentPage,
          hasNextPage: data.page?.pageInfo?.hasNextPage,
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
