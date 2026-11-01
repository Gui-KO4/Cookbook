import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          children: [
            Card(
              margin: EdgeInsets.zero,
              elevation: 2,
              shadowColor: Colors.black12,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Lista de Compras',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(
                          186,
                          238,
                          217,
                          1.0,
                        ),
                        foregroundColor: const Color(0xFF1B4D3E),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Por recolher (2)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Ingredientes',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: const [
                //TODO: Add the Widget's of Ingredients
              ],
            ),
            Row(
              children: const [
                Icon(Icons.task_alt),
                SizedBox(width: 10),
                Text(
                  'Recolhido (0)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildCookBookBottomNav(context, 2),
    );
  }
}
