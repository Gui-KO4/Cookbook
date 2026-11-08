import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '/Models/receita.dart'; 

class ReceitaService {
  static String get baseUrl {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:3000/api/recipes';
    }
    return 'http://localhost:3000/api/recipes';
  }
  static Future<List<Receita>> fetchReceitas() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        
        return body.map((dynamic item) => Receita.fromJson(item)).toList();
      } else {
        throw Exception('Erro ao carregar receitas: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Falha ao ligar ao servidor: $e');
    }
  }

  static Future<Receita> fetchReceitaPorId(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));

      if (response.statusCode == 200) {
        final dynamic body = jsonDecode(response.body);

        if (body is List && body.isNotEmpty) {
          return Receita.fromJson(body[0]);
        } else if (body is Map<String, dynamic>) {
          return Receita.fromJson(body);
        } else {
          throw Exception('Receita não encontrada');
        }
      } else {
        throw Exception('Erro ao carregar receita: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Falha ao ligar ao servidor: $e');
    }
  }
}