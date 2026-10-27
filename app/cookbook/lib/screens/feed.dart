import 'package:flutter/material.dart';
import '/widgets/recipe.dart';

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
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Container(
                padding: EdgeInsets.all(24),
                child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Today's Kitchen Feed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28), softWrap: true,),
                      Text("Fresh artisanal recipes tailored for you",style: TextStyle(fontFamily: 'Plus Jakarta Sans', fontSize: 14), softWrap: true,),

                  ],),),    
                  SizedBox(width: 12,),
                  ElevatedButton.icon(onPressed: () => {}, label: Text("24 New"), icon: Icon(Icons.auto_awesome), style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(186, 238, 217, 100), foregroundColor: Colors.black),),
                ]
              )
            ),
            Expanded(
              child:
              ListView.builder(
              itemCount: receitas.length, // Número total de receitas atualmente na memória
              itemBuilder: (context, index) {
                final receita = receitas[index];
                
                // Devolve o teu cartão configurado para esta receita
                return Container(
                padding: EdgeInsets.all(12),
                child: 
                  RecipeCard(
                    name: receita.nome,
                    details:  receita.descricao,
                    imgurl: receita.imgurl,
                    time: receita.tempo,
                    rating: receita.rating
                    ),
                  );
                },
              )
            ),
          ],
        );
  }
}
