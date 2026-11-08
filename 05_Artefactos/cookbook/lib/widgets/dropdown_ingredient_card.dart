import 'package:flutter/material.dart';
import '../Models/ingredients_models.dart';

class DropdownIngredientCard extends StatefulWidget {
  final Ingrediente ingredient;
  final void Function(int quantity) onAdd;

  const DropdownIngredientCard({
    super.key,
    required this.ingredient,
    required this.onAdd,
  });

  @override
  State<DropdownIngredientCard> createState() => _DropdownIngredientCardState();
}

class _DropdownIngredientCardState extends State<DropdownIngredientCard> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF5F7F4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.ingredient.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove, size: 18),
              onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
            ),
            Text('$_quantity', style: const TextStyle(fontWeight: FontWeight.bold)),
            IconButton(
              icon: const Icon(Icons.add, size: 18),
              onPressed: () => setState(() => _quantity++),
            ),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromRGBO(186, 238, 217, 1.0),
                foregroundColor: const Color(0xFF1B4D3E),
              ),
              icon: const Icon(Icons.check, size: 18),
              onPressed: () => widget.onAdd(_quantity),
            ),
          ],
        ),
      ),
    );
  }
}