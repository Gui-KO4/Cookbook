import 'package:flutter/material.dart';
import '../Models/store_map_model.dart';

class StoreBottomCard extends StatelessWidget {
  final StorePlace place;
  final VoidCallback onClose;

  const StoreBottomCard({
    super.key,
    required this.place,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF0A3828);

    return Card(
      margin: EdgeInsets.zero,
      elevation: 6,
      shadowColor: Colors.black26,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          if (place.formattedDistance.isNotEmpty) ...[
                            const Icon(
                              Icons.directions_walk,
                              size: 16,
                              color: Colors.black54,
                            ),
                            Text(
                              '${place.formattedDistance} • ${place.walkingEstimate}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                          if (place.openingHours != null)
                            Text(
                              place.openingHours!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: primaryGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: onClose,
                  icon: const Icon(Icons.close, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF3EF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: primaryGreen,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      place.address,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            if (place.phone != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.phone_outlined, size: 16, color: primaryGreen),
                  const SizedBox(width: 6),
                  Text(
                    place.phone!,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}