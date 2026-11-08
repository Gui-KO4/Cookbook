import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Models/ingredients_models.dart';

class IngredientsController {
  static String get baseUrl {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:3000/api';
    }
    return 'http://localhost:3000/api';
  }

  Future<List<Ingrediente>> fetchAllIngredients() async {
    final url = Uri.parse('$baseUrl/ingredients');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        return data
            .map((item) => Ingrediente.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        debugPrint('Error fetching ingredients: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Failed to fetch ingredients: $e');
    }
    return [];
  }
}