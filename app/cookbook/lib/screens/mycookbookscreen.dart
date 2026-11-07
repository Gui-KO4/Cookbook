import 'package:flutter/material.dart';
import '/widgets/saved_recipe_card.dart';

class MyCookbookScreen extends StatefulWidget {
  const MyCookbookScreen({super.key});

  @override
  State<MyCookbookScreen> createState() => _MyCookbookScreenState();
}

class _MyCookbookScreenState extends State<MyCookbookScreen> {
  int indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Meu CookBook',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Card(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A3828),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (indiceAtual == 0) {
                    Navigator.pushNamed(context, '/createRecipeIng');
                  }
                },
                child: Icon(
                  indiceAtual == 0 ? Icons.add_outlined : Icons.explore_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            indiceAtual == 0
                ? 'Gere as tuas receitas..'
                : 'Gere as receitas que guardaste de outros utilizadores..',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: indiceAtual == 0
                        ? const Color(0xFF0A3828)
                        : Colors.grey[200],
                    foregroundColor: indiceAtual == 0
                        ? Colors.white
                        : Colors.black,
                  ),
                  onPressed: () {
                    setState(() => indiceAtual = 0);
                  },
                  child: const Text('Criadas por mim'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: indiceAtual == 1
                        ? const Color(0xFF0A3828)
                        : Colors.green[200],
                    foregroundColor: indiceAtual == 1
                        ? Colors.white
                        : Colors.black,
                  ),
                  onPressed: () {
                    setState(() => indiceAtual = 1);
                  },
                  child: const Text('Receitas guardadas'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: indiceAtual == 0
                ? ListView(
                    children: const [
                      SavedRecipeCard(
                        nome: 'Receita criada1',
                        descricao: 'texto',
                        tempo: 20,
                        rating: 0,
                        imgurl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7hauW4vMNzNtwh_iBAhpEvFrAzm7tFtXGSkQbh3-QwA&s=10',
                      ),
                      SavedRecipeCard(
                        nome: 'Receita criada2',
                        descricao: 'texto',
                        tempo: 5,
                        rating: 10,
                        imgurl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs3JjeE2Eaha9Wg0-KT6-aOduwY9hIJZLGrjLU_n8rPQ&s=10',
                      ),
                    ],
                  )
                : ListView(
                    children: const [
                      SavedRecipeCard(
                        nome: 'Receita roubada1',
                        descricao: 'texto',
                        tempo: 20,
                        rating: 0,
                        imgurl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7hauW4vMNzNtwh_iBAhpEvFrAzm7tFtXGSkQbh3-QwA&s=10',
                      ),
                      SavedRecipeCard(
                        nome: 'Receita roubada2',
                        descricao: 'texto',
                        tempo: 5,
                        rating: 10,
                        imgurl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs3JjeE2Eaha9Wg0-KT6-aOduwY9hIJZLGrjLU_n8rPQ&s=10',
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}