// features/data/services/cat_services.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part "cat_services.g.dart";

@RestApi(baseUrl: "https://cataas.com")
abstract class CatService {
  factory CatService(Dio dio, {String? baseUrl}) = _CatService;

  @GET("/cat")
  Future<HttpResponse> getCatImage();
}
