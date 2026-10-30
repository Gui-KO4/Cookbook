import 'package:cookbook/screens/feed.dart';
import 'package:cookbook/screens/loginscreen.dart';
import 'package:cookbook/screens/registerscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CookBook',
      theme: ThemeData(fontFamily: 'poppins'),
      initialRoute: '/',
      routes: {
        '/': (context) => const FeedScreen(),
        /* '/cookbook': (context) => const cookbookScreen(), */
        //'/shopList': (context) => const ShoppingListScreen(),
        //'/map': (context) => const MapScreen(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
