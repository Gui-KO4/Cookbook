import 'package:flutter/material.dart';

import '/widgets/saved_recipe_card.dart';
import '/widgets/navbar.dart';

class MyCookbookScreen extends StatefulWidget {
  const MyCookbookScreen({super.key});
  @override
  State<MyCookbookScreen> createState() => _MyCookbookScreenState();
}

class _MyCookbookScreenState extends State<MyCookbookScreen> {
  int indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CookBook',
      theme: ThemeData(fontFamily: 'poppins'),
      home: Scaffold(
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
                onPressed: () => Navigator.pushNamed(context, '/'),
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
                  onPressed: () {},
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Meu CookBook',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Card(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A3828),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () => {
                      if (indiceAtual == 0)
                        {Navigator.pushNamed(context, '/createRecipeIng')}
                      else
                        {Navigator.pushNamed(context, '/cookbook')},
                    },
                    child: Icon(indiceAtual == 0 ? Icons.add_outlined : Icons.explore_outlined),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Text(
                indiceAtual == 0
                    ? 'Gere as tuas receitas..'
                    : 'Gere as receitas que guardaste de outros utilizadores..',
                style: TextStyle(fontSize: 14),
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
                        setState(() {
                          indiceAtual = 0;
                        });
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
                        setState(() {
                          indiceAtual = 1;
                        });
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
                        children: [
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
                        children: [
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
        ),
        bottomNavigationBar: buildCookBookBottomNav(context, 1),
      ),
    );
  }
}
