import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../features/data/services/cat_services.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final dio = Dio();
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => CatService(sl()));
}
