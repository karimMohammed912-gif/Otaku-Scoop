import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/graphQL/graphql_service.dart';
import 'package:otaku_scope/core/models/media.dart';
import 'package:otaku_scope/core/utils/enums.dart';
import 'package:otaku_scope/core/utils/paginatin_state.dart';
import 'package:otaku_scope/core/utils/theme_mode_controller.dart';
import 'package:otaku_scope/features/last_update_anime/controller/last_update_controller.dart';
import 'package:otaku_scope/features/last_update_anime/repo/last_update_repo.dart';
import 'package:otaku_scope/features/last_update_manga/controller/last_update_manga_controller.dart';
import 'package:otaku_scope/features/last_update_manga/repo/last_update_manga_repo.dart';
import 'package:otaku_scope/features/onboardingFeature/controller/onboarding_controller.dart';
import 'package:otaku_scope/features/seasonal_anime/controller/seasonal_anime_controller.dart';
import 'package:otaku_scope/features/seasonal_anime/repo/seasonal_anime_repo.dart';
import 'package:otaku_scope/features/top_anime/controller/top_anime_provider.dart';
import 'package:otaku_scope/features/top_anime/repo/top_anime_repo.dart';
import 'package:otaku_scope/features/top_manga/controller/top_manga_controller.dart';
import 'package:otaku_scope/features/top_manga/repo/top_manga_repo.dart';
import 'package:otaku_scope/features/search/repo/search_repo.dart';
import 'package:otaku_scope/features/search/controller/search_controller.dart';
import 'package:otaku_scope/features/details_feature/repo/details_repo.dart';
import 'package:otaku_scope/features/details_feature/controller/anime_details_controller.dart';
import 'package:otaku_scope/features/details_feature/controller/manga_details_controller.dart';
import 'package:flutter/material.dart' as material;

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  return dio;
});


final seasonalAnimeRepoProvider = Provider((ref) {
  return SeasonalAnimeRepo(ref.watch(graphQLServiceProvider));
});



final seasonalAnimeNotifierProvider =
    StateNotifierProvider.family<SeasonalAnimeController, PaginatedState<Media>, String>((ref, String season) {
  final repo = ref.watch(seasonalAnimeRepoProvider);
  return SeasonalAnimeController(repo, season);
});


  

final graphQLServiceProvider = Provider<GraphQLService>((ref) {
  return GraphQLService(ref.watch(dioProvider));
});

final topAnimeRepoProvider = Provider((ref) {
  return TopAnimeRepo(ref.watch(graphQLServiceProvider));
});

final lastUpdateRepoProvider = Provider((ref) {
  return LastUpdateRepo(ref.watch(graphQLServiceProvider));
});

final topAnimeNotifierProvider =
    StateNotifierProvider.family<TopAnimeNotifier, PaginatedState<Media>, TopAnimeCategory>((ref, TopAnimeCategory category) {
  final repo = ref.watch(topAnimeRepoProvider);
  return TopAnimeNotifier(repo, category);
});

final lastUpdateNotifierProvider =
    StateNotifierProvider<LastUpdateNotifier, PaginatedState<Media>>((ref) {
  final repo = ref.watch(lastUpdateRepoProvider);
  return LastUpdateNotifier(repo);
});


final topMangaRepoProvider = Provider((ref) {
  return TopMangaRepo(ref.watch(graphQLServiceProvider));
});
final topMangaNotifierProvider =
    StateNotifierProvider.family<TopMangaNotifier, PaginatedState<Media>, TopMangaCategory>((ref, TopMangaCategory category) {
  final repo = ref.watch(topMangaRepoProvider);
  return TopMangaNotifier(repo, category);
});

final lastUpdateMangaRepoProvider = Provider((ref) {
  return LastUpdateMangaRepo(ref.watch(graphQLServiceProvider));
}); 

final lastUpdateMangaNotifierProvider =
    StateNotifierProvider<LastUpdateMangaController, PaginatedState<Media>>((ref) {
  final repo = ref.watch(lastUpdateMangaRepoProvider);
  return LastUpdateMangaController(repo);
});

final searchRepoProvider = Provider((ref) {
  return SearchRepo(ref.watch(graphQLServiceProvider));
});

final searchNotifierProvider = StateNotifierProvider<SearchController, PaginatedState<Media>>((ref) {
  final repo = ref.watch(searchRepoProvider);
  return SearchController(repo);
});

final animeDetailsRepoProvider = Provider((ref) {
  return AnimeDetailsRepo(ref.watch(graphQLServiceProvider));
});

final animeDetailsNotifierProvider = StateNotifierProvider.family<AnimeDetailsController, AnimeDetailsState, int>((ref, int id) {
  final repo = ref.watch(animeDetailsRepoProvider);
  final controller = AnimeDetailsController(repo);
  // Lazy load on first listen
  Future.microtask(() => controller.load(id));
  return controller;
});

final mangaDetailsNotifierProvider = StateNotifierProvider.family<MangaDetailsController, MangaDetailsState, int>((ref, int id) {
  final repo = ref.watch(animeDetailsRepoProvider);
  final controller = MangaDetailsController(repo);
  // Lazy load on first listen
  Future.microtask(() => controller.load(id));
  return controller;
});

final themeModeProvider = StateNotifierProvider<ThemeModeController, material.ThemeMode>((ref) {
  return ThemeModeController();
});


final onboardingControllerProvider = StateNotifierProvider<OnboardingController, bool>((ref) {
  return OnboardingController();
});