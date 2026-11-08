import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Models/shopping_list_model.dart';

class ShoppingListController {
  static String get baseUrl {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:3000/api';
    }
    return 'http://localhost:3000/api';
  }

  Future<List<ShoppingItem>> fetchShoppingList(int userId) async {
    final url = Uri.parse('$baseUrl/shopping-list/$userId');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        return data
            .map((item) => ShoppingItem.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        debugPrint('Error fetching shopping list: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Failed to fetch shopping list: $e');
    }
    return [];
  }

  Future<bool> addShoppingItem({
    required int userId,
    required int ingredientId,
    required double quantity,
  }) async {
    final url = Uri.parse('$baseUrl/shopping-list');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id_utilizador': userId,
          'id_ingrediente': ingredientId,
          'quantidade': quantity,
        }),
      );
      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      debugPrint('Failed to add shopping item: $e');
      return false;
    }
  }

  Future<bool> toggleShoppingItem(int itemId, bool isChecked) async {
    final url = Uri.parse('$baseUrl/shopping-list/$itemId');
    try {
      final response = await http.patch(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'check_comprado': isChecked}),
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Failed to toggle item: $e');
      return false;
    }
  }

  Future<bool> deleteShoppingItem(int itemId) async {
    final url = Uri.parse('$baseUrl/shopping-list/$itemId');
    try {
      final response = await http.delete(url);
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Failed to delete item: $e');
      return false;
    }
  }
}