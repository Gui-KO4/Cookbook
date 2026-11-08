import 'package:flutter/material.dart';
import '/Models/receita.dart';
import '/widgets/recipe.dart';
import '/data/receitas.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late Future<List<Receita>> _receitasFuture;

  @override
  void initState() {
    super.initState();
    _receitasFuture = ReceitaService.fetchReceitas();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Kitchen Feed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF0F382C),
                        letterSpacing: -0.5,
                      ),
                      softWrap: true,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Fresh artisanal recipes tailored for you",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF5C6B64),
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text("24 New"),
                icon: const Icon(Icons.auto_awesome, size: 16),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBAEED9),
                  foregroundColor: const Color(0xFF0F382C),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Receita>>(
            future: _receitasFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF0F382C),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Erro: ${snapshot.error}',
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    'Nenhuma receita encontrada.',
                    style: TextStyle(color: Color(0xFF5C6B64)),
                  ),
                );
              }

              final receitas = snapshot.data!;

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: receitas.length,
                itemBuilder: (context, index) {
                  final receita = receitas[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: RecipeCard(
                      idReceita: receita.id,
                      name: receita.titulo,
                      details: receita.descricao,
                      imgurl: receita.foto,
                      time: receita.tempoPreparacao,
                      dificuldade: receita.dificuldade,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}