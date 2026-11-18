import 'package:flutter/material.dart';

Widget buildCookBookBottomNav({
  required int currentIndex,
  required ValueChanged<int> onTap,
}) {
  Widget navItem(IconData icon, String label, int index) {
    const activeColor = Color(0xFF0A3828);
    const inactiveColor = Color(0xFF4A5550);
    final bool isSelected = currentIndex == index;

    return Expanded(
      child: Material(
        color: isSelected ? activeColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          splashColor: activeColor.withValues(alpha: 0.15),
          highlightColor: activeColor.withValues(alpha: 0.08),
          onTap: () => onTap(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: isSelected ? Colors.white : inactiveColor,
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? Colors.white : inactiveColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  return Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 20,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        navItem(Icons.home_outlined, 'Inicio', 0),
        navItem(Icons.menu_book_outlined, 'Cookbook', 1),
        navItem(Icons.shopping_cart_outlined, 'Carrinho', 2),
        navItem(Icons.map_outlined, 'Mapa', 3),
      ],
    ),
  );
}