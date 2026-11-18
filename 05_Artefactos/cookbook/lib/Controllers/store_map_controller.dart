import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import '../Models/store_map_model.dart';

class MapStoreController {
  static const String apiKey = String.fromEnvironment(
    'GEOAPIFY_API_KEY',
    defaultValue: '',
  );

  final List<StoreCategory> categories = const [
    StoreCategory(
      label: 'Supermarkets',
      apiCategory: 'commercial.supermarket',
      icon: Icons.local_grocery_store_outlined,
    ),
    StoreCategory(
      label: 'Shopping Centers',
      apiCategory: 'commercial.shopping_mall',
      icon: Icons.local_mall_outlined,
    ),
    StoreCategory(
      label: 'Convenience Stores',
      apiCategory: 'commercial.convenience',
      icon: Icons.storefront_outlined,
    ),
  ];

  Future<List<StorePlace>> fetchStores({
    required StoreCategory category,
    required LatLng center,
    int radiusMeters = 3000,
  }) async {
    final url = Uri.parse(
      'https://api.geoapify.com/v2/places'
      '?categories=${category.apiCategory}'
      '&filter=circle:${center.longitude},${center.latitude},$radiusMeters'
      '&bias=proximity:${center.longitude},${center.latitude}'
      '&limit=25'
      '&apiKey=$apiKey',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final features = data['features'] as List<dynamic>? ?? [];

        return features
            .map((f) => StorePlace.fromGeoapify(
                  f as Map<String, dynamic>,
                  category.icon,
                ))
            .toList();
      } else {
        debugPrint('Geoapify error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Failed to fetch stores: $e');
    }
    return [];
  }
}