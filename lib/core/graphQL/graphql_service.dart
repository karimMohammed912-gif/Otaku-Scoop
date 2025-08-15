import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'graphql_service.g.dart';

@RestApi(baseUrl: "https://graphql.anilist.co")
abstract class GraphQLService {
  factory GraphQLService(Dio dio, {String baseUrl}) = _GraphQLService;

  /// Send a GraphQL request
  @POST("/")
  Future<Map<String, dynamic>> sendQuery(@Body() Map<String, dynamic> body);
}
