import 'package:flutter/material.dart';

Widget buildCookBookBottomNav(
  BuildContext context,
  int currentIndex, {
  ValueChanged<int>? onTap,
}) {
  void handleNavigation(int index) {
    if (index == currentIndex) return;
    if (onTap != null) {
      onTap(index);
      return;
    }

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/CreateRecipeIng');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/shopList');
        break;
      case 3:
        // Navigator.pushReplacementNamed(context, '/map');
        break;
    }
  }

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
          onTap: () => handleNavigation(index),
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