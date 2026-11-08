import 'package:cookbook/screens/feed.dart';
//import 'package:cookbook/screens/mapscreen.dart';
//import 'package:cookbook/screens/shoppinglistscreen.dart';
import 'package:flutter/material.dart';

// Import Pages
import 'package:cookbook/screens/feed.dart';
import 'package:cookbook/screens/mapscreen.dart';
import 'package:cookbook/screens/shoppinglistscreen.dart';
import 'package:cookbook/screens/loginscreen.dart';
import 'package:cookbook/screens/registerscreen.dart';
import 'package:cookbook/screens/createrecipe.dart';
import 'package:cookbook/screens/mycookbookscreen.dart';
import 'package:cookbook/screens/recipescreen.dart';
import 'package:cookbook/widgets/navbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CookBook',
      theme: ThemeData(
        fontFamily: 'poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PaginaPrincipal(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/createRecipeIng': (context) => const CreateRecipeScreen(),
      },
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int indiceAtual = 0;

  final paginas = const [
    FeedScreen(),
    MyCookbookScreen(),
    ShoppingListScreen(),
    MapScreen(),
    Recipescreen(),
  ];

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
              onPressed: () => setState(() => indiceAtual = 0),
            ),
          ),
        ),
        title: const Text(
          'CookBook',
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
      body: paginas[indiceAtual],
      bottomNavigationBar: buildCookBookBottomNav(
        currentIndex: indiceAtual,
        onTap: (novoIndice) {
          setState(() => indiceAtual = novoIndice);
        },
      ),
    );
  }
}