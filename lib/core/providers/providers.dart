import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/graphQL/graphql_service.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  return dio;
});


final graphqlServiceProvider = Provider<GraphQLService>((ref) {
  final dio = ref.watch(dioProvider);
  return GraphQLService(dio);
});