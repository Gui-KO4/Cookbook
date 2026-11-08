import 'package:flutter/material.dart';
import '/widgets/recipe.dart';
import '/Models/receita.dart';

final receitas = [
  Receita(id: 1, idAutor: 1, titulo: 'Choco', descricao: 'Bolo de chocolate', tempoPreparacao: 30, tempoForno: 0, dificuldade: 'Facil', visibilidade: 'Publico',foto: 'https://...', dataCriacao: DateTime.now()),
  Receita(id: 1, idAutor: 1, titulo: 'Choco', descricao: 'Bolo de chocolate', tempoPreparacao: 30, tempoForno: 0, dificuldade: 'Facil', visibilidade: 'Publico',foto: 'https://...', dataCriacao: DateTime.now()),
  Receita(id: 1, idAutor: 1, titulo: 'Choco', descricao: 'Bolo de chocolate', tempoPreparacao: 30, tempoForno: 0, dificuldade: 'Facil', visibilidade: 'Publico',foto: 'https://...', dataCriacao: DateTime.now()),
  Receita(id: 1, idAutor: 1, titulo: 'Choco', descricao: 'Bolo de chocolate', tempoPreparacao: 30, tempoForno: 0, dificuldade: 'Facil', visibilidade: 'Publico',foto: 'https://...', dataCriacao: DateTime.now()),
];

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Today's Kitchen Feed",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                      softWrap: true,
                    ),
                    Text(
                      "Fresh artisanal recipes tailored for you",
                      style: TextStyle(fontFamily: 'Plus Jakarta Sans', fontSize: 14),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text("24 New"),
                icon: const Icon(Icons.auto_awesome),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(186, 238, 217, 100),
                  foregroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: receitas.length,
            itemBuilder: (context, index) {
              final receita = receitas[index];
              return Container(
                padding: const EdgeInsets.all(12),
                child: RecipeCard(
                  name: receita.titulo,
                  details: receita.descricao,
                  imgurl: receita.foto,
                  time: receita.tempoPreparacao,
                  dificuldade: receita.dificuldade,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
