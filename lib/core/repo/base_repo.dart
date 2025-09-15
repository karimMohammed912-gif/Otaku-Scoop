import 'dart:developer' as dev;
import 'dart:math' as math;

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
    const int maxRetries = 3;
    const Duration baseDelay = Duration(milliseconds: 300);

    int attempt = 0;
    while (true) {
     
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

        final parsedData = parser(dataToParse);
        dev.log("Parsed data: $parsedData", name: "BaseRepo");
        return Result.success(parsedData);
      } on DioException catch (e) {
        attempt += 1;
        final status = e.response?.statusCode;
        final isRateLimited = status == 429;
        final isTransient = e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown ||
            status == 502 || status == 503 || status == 504 || isRateLimited;

        dev.log("DioException (attempt $attempt/${maxRetries + 1}): ${e.message} status=$status", name: "BaseRepo");
          // Retry with exponential backoff for transient errors
        if (isTransient && attempt <= maxRetries) {
          // Respect Retry-After if provided for 429s
          Duration delay;
          if (isRateLimited) {
            // If Retry-After header is provided, use it  
            final retryAfterHeader = e.response?.headers.value('retry-after');
            final retryAfterSeconds = int.tryParse(retryAfterHeader ?? '');
            if (retryAfterSeconds != null && retryAfterSeconds > 0) {
              delay = Duration(seconds: retryAfterSeconds);
            } else {
              final backoffMs = baseDelay.inMilliseconds * math.pow(2, attempt - 1).toInt();
              delay = Duration(milliseconds: backoffMs);
            }
          } else {
            final backoffMs = baseDelay.inMilliseconds * math.pow(2, attempt - 1).toInt();
            // Cap backoff to 2 seconds
            delay = Duration(milliseconds: math.min(backoffMs, 2000));
          }
          await Future.delayed(delay);
          continue; // retry
        }

        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          return Result.failure(const Failure.network("Connection timeout"));
        }

        final msg = e.response?.data?.toString() ?? e.message ?? "Server error";
        return Result.failure(Failure.server(status, msg));
      } catch (e) {
        dev.log("Unknown error: $e", name: "BaseRepo");
        return Result.failure(Failure.unknown(e.toString()));
      }
    }
  }
}
