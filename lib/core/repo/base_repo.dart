import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:otaku_scope/core/errors/failure.dart';
import 'package:otaku_scope/core/graphQL/graphql_service.dart';
import 'package:otaku_scope/core/utils/result.dart';

abstract class BaseRepo {
  final GraphQLService service;
  const BaseRepo(this.service);

  Future<Result<T>> request<T>({
    required String query,
    required T Function(Map<String, dynamic> json) parser,
  }) async {
    try {
      final res = await service.send({"query": query});
      dev.log("getting data: $res", name: "BaseRepo");

      final errors = res["errors"] as List<dynamic>?;
      if (errors != null && errors.isNotEmpty) {
        final msg = errors.map((e) => e["message"]).join(" | ");
        return Result.failure(Failure.graphql(msg));
      }

      final dataToParse = res["data"];
      if (dataToParse == null) {
        return Result.failure(const Failure.graphql("Response data is null"));
      }

      // FIX: Call the parser with the correct data and return its result.
      final parsedData = parser(dataToParse);
      dev.log("Parsed data: $parsedData", name: "BaseRepo");
      return Result.success(parsedData);
    } on DioException catch (e) {
      dev.log("DioException: ${e.message}", name: "BaseRepo");
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return Result.failure(const Failure.network("Connection timeout"));
      }
      final status = e.response?.statusCode;
      final msg = e.response?.data?.toString() ?? e.message ?? "Server error";
      return Result.failure(Failure.server(status, msg));
    } catch (e) {
      dev.log("Unknown error: $e", name: "BaseRepo");
      return Result.failure(Failure.unknown(e.toString()));
    }
  }
}
