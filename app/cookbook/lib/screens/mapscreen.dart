import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  bool _isMapReady = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 250), () {
      if (mounted) {
        setState(() => _isMapReady = true);
      }
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          children: [
            Row(
              spacing: 8.0,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Filter Exemple 1'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Filter Exemple 2'),
                ),
              ],
            ),
            Expanded(
              child: RepaintBoundary(
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(16.0),
                  child: _isMapReady
                      ? Stack(
                          children: [
                            FlutterMap(
                              mapController: _mapController,
                              options: const MapOptions(
                                initialCenter: LatLng(38.7223, -9.1393),
                                initialZoom: 13.0,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName: 'cookbook',
                                  panBuffer: 0,
                                  keepBuffer: 1,
                                ),
                              ],
                            ),
                            const Text("EXEMPLO GRANDE"),
                          ],
                        )
                      : Container(
                          color: Colors.black.withValues(alpha: 0.04),
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            color: Color(0xFF1B4D3E),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}