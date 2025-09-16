import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/graphQL/graphql_service.dart';
import 'package:otaku_scope/core/models/media.dart';
import 'package:otaku_scope/core/utils/enums.dart';
import 'package:otaku_scope/core/utils/paginatin_state.dart';
import 'package:otaku_scope/features/last_update/controller/last_update_controller.dart';
import 'package:otaku_scope/features/last_update/repo/last_update_repo.dart';
import 'package:otaku_scope/features/top_anime/controller/top_anime_provider.dart';
import 'package:otaku_scope/features/top_anime/repo/top_anime_repo.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  return dio;
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