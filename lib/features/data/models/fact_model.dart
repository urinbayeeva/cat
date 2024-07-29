// features/data/models/fact_model.dart
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';

part 'fact_model.g.dart';

@HiveType(typeId: 1)
class CatFact extends HiveObject {
  @HiveField(0)
  final String text;

  CatFact({required this.text});

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      text: json['text'],
    );
  }
}
