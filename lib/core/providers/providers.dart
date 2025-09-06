import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/graphQL/graphql_service.dart';
import 'package:otaku_scope/core/utils/paginatin_state.dart';
import 'package:otaku_scope/features/top_anime/controller/top_anime_provider.dart';
import 'package:otaku_scope/features/top_anime/model/top_anime_model/media.dart';
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

final topAnimeRepoProvider = Provider<TopAnimeRepo>((ref) {
  return TopAnimeRepo(ref.watch(graphQLServiceProvider));
});

final topAnimeNotifierProvider =
    StateNotifierProvider<TopAnimeNotifier, PaginatedState<Media>>((ref) {
  return TopAnimeNotifier(ref.watch(topAnimeRepoProvider));
});
