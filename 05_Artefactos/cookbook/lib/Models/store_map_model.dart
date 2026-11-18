import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class StoreCategory {
  final String label;
  final String apiCategory;
  final IconData icon;

  const StoreCategory({
    required this.label,
    required this.apiCategory,
    required this.icon,
  });
}

class StorePlace {
  final String name;
  final String address;
  final String? openingHours;
  final String? phone;
  final double? distanceMeters;
  final LatLng location;
  final IconData icon;

  const StorePlace({
    required this.name,
    required this.address,
    this.openingHours,
    this.phone,
    this.distanceMeters,
    required this.location,
    required this.icon,
  });

  factory StorePlace.fromGeoapify(
    Map<String, dynamic> feature,
    IconData categoryIcon,
  ) {
    final props = feature['properties'] as Map<String, dynamic>? ?? {};
    final contact = props['contact'] as Map<String, dynamic>?;

    return StorePlace(
      name: (props['name'] as String?)?.trim().isNotEmpty == true
          ? props['name'] as String
          : (props['street'] as String? ?? 'Store'),
      address: props['address_line2'] as String? ??
          props['formatted'] as String? ??
          'Address unavailable',
      openingHours: props['opening_hours'] as String?,
      phone: contact?['phone']?.toString(),
      distanceMeters: (props['distance'] as num?)?.toDouble(),
      location: LatLng(
        (props['lat'] as num).toDouble(),
        (props['lon'] as num).toDouble(),
      ),
      icon: categoryIcon,
    );
  }

  String get formattedDistance {
    if (distanceMeters == null) return '';
    if (distanceMeters! < 1000) return '${distanceMeters!.round()} m';
    return '${(distanceMeters! / 1000).toStringAsFixed(1)} km';
  }

  String get walkingEstimate {
    if (distanceMeters == null) return '';
    final minutes = (distanceMeters! / 80).ceil();
    return '$minutes min walk';
  }
}