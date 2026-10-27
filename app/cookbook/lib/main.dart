import 'package:flutter/material.dart';
import 'mainnavigationscreen.dart';

void main() => runApp(const MyApp());

class Receita {
  final String nome;
  final String descricao;
  final String imgurl;
  final int tempo;
  final int rating;
  const Receita(this.nome, this.descricao,this.imgurl, this.tempo, this.rating);
}

const receitas = [
  Receita("choco", "choco", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7hauW4vMNzNtwh_iBAhpEvFrAzm7tFtXGSkQbh3-QwA&s=10", 4, 5),
    Receita("choco", "choco", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs3JjeE2Eaha9Wg0-KT6-aOduwY9hIJZLGrjLU_n8rPQ&s=10 ", 4, 5),
      Receita("choco", "choco", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-Q3Il2CTqOPWWO46lY0GE5f1YHYUGJKyODzVeMgbe8Q&s=10 ", 4, 5),
        Receita("choco", "choco", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh6YDRmFltn0tccuJQ4fEl60FsbV1knQLep7SRD1lFfg&s=10 ", 4, 5),
];
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
