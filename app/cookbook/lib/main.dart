import 'package:flutter/material.dart';
// Import Pages
import 'package:cookbook/screens/feed.dart';
import 'package:cookbook/screens/mapscreen.dart';
import 'package:cookbook/screens/shoppinglistscreen.dart';
import 'package:cookbook/screens/loginscreen.dart';
import 'package:cookbook/screens/registerscreen.dart';
import 'package:cookbook/screens/createrecipe.dart';
import 'package:cookbook/screens/mycookbookscreen.dart';

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
        '/': (context) => const FeedScreen(),
        '/cookbook': (context) => const MyCookbookScreen(),
        '/shopList': (context) => const ShoppingListScreen(),
        '/map': (context) => const MapScreen(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/createRecipeIng': (context) => const CreateRecipeScreen(),

      },
    );
  }
}