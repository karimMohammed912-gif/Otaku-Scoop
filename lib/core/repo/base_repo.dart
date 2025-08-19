import 'package:dio/dio.dart';
import 'package:otaku_scope/core/errors/failure.dart';
import 'package:otaku_scope/core/graphQL/graphql_service.dart';
import 'package:otaku_scope/core/utils/result.dart';


abstract class BaseRepo {
  final GraphQLService service;
  const BaseRepo(this.service);

  Future<Result<T>> request<T>({
    required String query,
    Map<String, dynamic>? variables,
    required T Function(Map<String, dynamic> json) parser,
  }) async {
    try {
      final res = await service.send({
        "query": query,
        if (variables != null) "variables": variables,
      });

      // GraphQL ممكن يرجّع 200 ومعاه errors في البودي
      final errors = res["errors"] as List<dynamic>?;
      if (errors != null && errors.isNotEmpty) {
        final msg = errors.map((e) => e["message"]).join(" | ");
        return Result.failure(Failure.graphql(msg));
      }

      final data = parser(res); // انت بتحدّد هتسحب إيه من JSON
      return Result.success(data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return Result.failure(const Failure.network("Connection timeout"));
      }
      final status = e.response?.statusCode;
      final msg = e.response?.data?["message"]?.toString() ?? e.message ?? "Server error";
      return Result.failure(Failure.server(status, msg));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }
}
