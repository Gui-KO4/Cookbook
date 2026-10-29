//import 'package:cookbook/screens/shoppinglistscreen.dart';
import 'package:cookbook/screens/createrecipe.dart';
import 'package:cookbook/screens/feed.dart';
import 'package:flutter/material.dart';

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
        '/CreateRecipeIng': (context) => const CreateRecipeScreen(),
        //'/shopList': (context) => const ShoppingListScreen(),
        /* '/map': (context) => const MapScreen(), */
      },
    );
  }
}