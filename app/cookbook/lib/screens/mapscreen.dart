import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../Models/store_map_model.dart';
import '../controllers/store_map_controller.dart';
import '../widgets/store_bottom_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const LatLng _initialCenter = LatLng(38.7223, -9.1393);
  static const Color _primaryGreen = Color(0xFF0A3828);

  final MapController _mapController = MapController();
  final MapStoreController _storeController = MapStoreController();

  bool _isMapReady = false;
  bool _isLoading = false;
  int? _selectedFilterIndex;
  List<StorePlace> _places = [];
  StorePlace? _selectedPlace;

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

  Future<void> _onFilterSelected(int index) async {
    final center = _isMapReady ? _mapController.camera.center : _initialCenter;
    final category = _storeController.categories[index];

    setState(() {
      _selectedFilterIndex = index;
      _isLoading = true;
      _selectedPlace = null;
    });

    final results = await _storeController.fetchStores(
      category: category,
      center: center,
    );

    if (mounted) {
      setState(() {
        _places = results;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 12.0,
          children: [
            // Botões de filtro
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 8.0,
                children: List.generate(
                  _storeController.categories.length,
                  (index) {
                    final category = _storeController.categories[index];
                    final isSelected = _selectedFilterIndex == index;

                    return ElevatedButton.icon(
                      onPressed: () => _onFilterSelected(index),
                      icon: Icon(
                        category.icon,
                        size: 18,
                        color: isSelected ? Colors.white : _primaryGreen,
                      ),
                      label: Text(category.label),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isSelected ? _primaryGreen : Colors.white,
                        foregroundColor:
                            isSelected ? Colors.white : Colors.black87,
                        elevation: isSelected ? 2 : 0,
                        side: BorderSide(
                          color: isSelected
                              ? _primaryGreen
                              : Colors.black.withValues(alpha: 0.12),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Mapa
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
                              options: MapOptions(
                                initialCenter: _initialCenter,
                                initialZoom: 14.0,
                                onTap: (_, _) {
                                  if (_selectedPlace != null) {
                                    setState(() => _selectedPlace = null);
                                  }
                                },
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName: 'cookbook',
                                  panBuffer: 0,
                                  keepBuffer: 1,
                                ),
                                MarkerLayer(
                                  markers: _places.map((place) {
                                    final isSelected = _selectedPlace == place;
                                    return Marker(
                                      point: place.location,
                                      width: 80,
                                      height: 70,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () => _selectedPlace = place,
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (place.formattedDistance
                                                .isNotEmpty)
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 6,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: isSelected
                                                      ? _primaryGreen
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      blurRadius: 4,
                                                    ),
                                                  ],
                                                ),
                                                child: Text(
                                                  place.formattedDistance,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.black87,
                                                  ),
                                                ),
                                              ),
                                            const SizedBox(height: 4),
                                            Container(
                                              padding: EdgeInsets.all(
                                                isSelected ? 9 : 7,
                                              ),
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? _primaryGreen
                                                    : Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: _primaryGreen,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Icon(
                                                place.icon,
                                                  size: isSelected ? 18 : 15,
                                                color: isSelected
                                                    ? Colors.white
                                                    : _primaryGreen,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),

                            // Ponto central
                            IgnorePointer(
                              child: Center(
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blueAccent
                                            .withValues(alpha: 0.4),
                                        blurRadius: 10,
                                        spreadRadius: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Circulo de loading
                            if (_isLoading)
                              const Positioned(
                                top: 12,
                                right: 12,
                                child: Card(
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        color: _primaryGreen,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            // Cartão de informação
                            if (_selectedPlace != null)
                              Positioned(
                                left: 12,
                                right: 12,
                                bottom: 12,
                                child: StoreBottomCard(
                                  place: _selectedPlace!,
                                  onClose: () =>
                                      setState(() => _selectedPlace = null),
                                ),
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
    );
  }
}