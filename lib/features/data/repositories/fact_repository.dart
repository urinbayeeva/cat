// features/data/repositories/fact_repository.dart
import 'package:cat_trivia/features/data/models/fact_model.dart';
import 'package:cat_trivia/features/data/services/fact_services.dart';

class FactRepository {
  final FactServices factServices;

  FactRepository(this.factServices);

  Future<CatFact> fetchCatFact() async {
    final response = await factServices.getFacts();
    return CatFact.fromJson(response.data);
  }
}
