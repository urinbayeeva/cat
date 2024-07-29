// features/data/services/fact_services.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'fact_services.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com")
abstract class FactServices {
  factory FactServices(Dio dio, {String baseUrl}) = _FactServices;

  @GET("/facts")
  Future<HttpResponse> getFacts();
}
