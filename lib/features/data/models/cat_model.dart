// features/data/models/cat_model.dart
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';

part 'cat_model.g.dart';

@HiveType(typeId: 0)
class CatImage extends HiveObject {
  @HiveField(0)
  final String url;

  CatImage({required this.url});

  factory CatImage.fromJson(Map<String, dynamic> json) {
    return CatImage(
      url: json['url'],
    );
  }
}
