import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'graphql_service.g.dart';

@RestApi(baseUrl: "https://graphql.anilist.co")
abstract class GraphQLService {
  factory GraphQLService(Dio dio, {String baseUrl}) = _GraphQLService;

  @POST("/")
  Future<Map<String, dynamic>> send(@Body() Map<String, dynamic> body);
}
