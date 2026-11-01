import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/navbar.dart';

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
    // Espera um pouco antes de indicar que o mapa esta pronto
    Future.delayed(const Duration(milliseconds: 250), () {
      if (mounted) {
        setState(() => _isMapReady = true);
      }
    });
  }

  @override
  void dispose() {
    _mapController.dispose(); // Ao trocar de tela o mapa é deletado para evitar que continue a consumir memoria
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.black.withValues(alpha: 0.04),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.black87, size: 20),
              onPressed: () => Navigator.pushNamed(context, '/'),
            ),
          ),
        ),
        title: const Text(
          "CookBook",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFF1B4D3E),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pushNamed(context, '/login'),
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
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
                        ? FlutterMap(
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
                                panBuffer: 0, // Faz com que o mapa não carregue tiles fora da tela
                                keepBuffer: 1,
                              ),
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
      ),
      bottomNavigationBar: buildCookBookBottomNav(context, 3),
    );
  }
}