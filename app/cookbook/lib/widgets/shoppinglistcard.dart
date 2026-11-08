import 'package:flutter/material.dart';
import '../Models/shopping_list_model.dart';

class ShoppingListCard extends StatelessWidget {
  final ShoppingItem item;
  final ValueChanged<bool?> onCheckChanged;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ShoppingListCard({
    super.key,
    required this.item,
    required this.onCheckChanged,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10.0),
      elevation: 2,
      shadowColor: Colors.black12,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Row(
          children: [
            Checkbox(
              value: item.isChecked,
              activeColor: const Color(0xFF1B4D3E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              onChanged: onCheckChanged,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      decoration: item.isChecked
                          ? TextDecoration.lineThrough
                          : null,
                      color: item.isChecked ? Colors.grey : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE5DF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${item.quantity.toStringAsFixed(item.quantity.truncateToDouble() == item.quantity ? 0 : 1)} un',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7A2E1D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton.filledTonal(
              visualDensity: VisualDensity.compact,
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFFEEF1EA),
                foregroundColor: Colors.black87,
              ),
              onPressed: onDecrement,
              icon: const Icon(Icons.remove, size: 16),
            ),
            const SizedBox(width: 6),
            IconButton.filledTonal(
              visualDensity: VisualDensity.compact,
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFFEEF1EA),
                foregroundColor: Colors.black87,
              ),
              onPressed: onIncrement,
              icon: const Icon(Icons.add, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}