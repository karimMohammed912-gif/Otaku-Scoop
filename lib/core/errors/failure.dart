import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.server(int? statusCode, String message) = ServerFailure;
  const factory Failure.graphql(String message) = GraphQLFailure;
  const factory Failure.unknown(String message) = UnknownFailure;
}
