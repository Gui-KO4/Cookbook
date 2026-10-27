import 'package:flutter/material.dart';
import 'mainnavigationscreen.dart';

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
      home: MainNavigationScreen(),
      
    );
  }
}
