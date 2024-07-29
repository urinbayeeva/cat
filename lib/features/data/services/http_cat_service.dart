// features/data/services/http_cat_service.dart
// import 'package:cat_trivia/core/constants/app_endpoints.dart';
// import 'package:http/http.dart' as http;

// class CatService {
//   final String _baseUrl = AppEndpoints.catImageUrl;
//   final String _factBaseUrl = AppEndpoints.apiFact;

//   Future<String> fetchCatImage() async {
//     final response = await http.get(Uri.parse(_baseUrl));
//     if (response.statusCode == 200) {
//       return _baseUrl;
//     } else {
//       throw Exception('Failed to load cat image');
//     }
//   }

//   Future<String> fetchFacts() async {
//     final response = await http.get(Uri.parse(_factBaseUrl));
//     if (response.statusCode == 200) {
//       return _factBaseUrl;
//     } else {
//       throw Exception('Failed to load facts');
//     }
//   }
// }
