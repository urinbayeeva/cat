// features/data/repositories/cat_repository.dart
import 'package:cat_trivia/features/data/models/cat_model.dart';
import 'package:cat_trivia/features/data/models/cat_model.dart';
import 'package:cat_trivia/features/data/services/cat_services.dart';
import 'package:dio/dio.dart';

class CatRepository {
  final CatService catService;

  CatRepository(this.catService);

  Future<CatImage> fetchCatImage() async {
    final response = await catService.getCatImage();
    return CatImage.fromJson(response.data);
  }
}
