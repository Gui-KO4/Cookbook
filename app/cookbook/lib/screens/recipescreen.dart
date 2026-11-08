import 'package:flutter/material.dart';
import '/Models/receita.dart';
import '/Models/ingredients.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final Receita receita = Receita(
  id: 1, idAutor: 1, titulo: 'Choco', descricao: 'Bolo de chocolate',
  tempoPreparacao: 30, tempoForno: 0, dificuldade: 'Facil', visibilidade: 'Publico',
  foto: 'https://...', dataCriacao: DateTime.now(),
);





class Recipescreen extends StatefulWidget {
  const Recipescreen({super.key});
    
    
        @override
        State<Recipescreen> createState() => _RecipescreenState();
      }

      class _RecipescreenState extends State<Recipescreen> {
        List<dynamic> _dbIngredients = [];
        bool _isLoading = true;
        String _errorMessage = '';

        @override
        void initState() {
          super.initState();
          _fetchRecipeTest();
        }

      Future<void> _fetchRecipeTest() async {
          try {
            // Adjust the URL/port if running on a physical device vs emulator (e.g., 10.0.2.2 for Android emulator)
              final response = await http.get(Uri.parse('http://localhost:3000/api/recipes'));

            if (response.statusCode == 200) {
              setState(() {
                _dbIngredients = jsonDecode(response.body);
                _isLoading = false;
              });
            } else {
              setState(() {
                _errorMessage = 'Failed to load: ${response.statusCode}';
                _isLoading = false;
              });
            }
          } catch (e) {
            setState(() {
              _errorMessage = 'Error connecting to backend: $e';
              _isLoading = false;
            });
          }
        }


  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp( 
      home: Scaffold(
        appBar: AppBar(title: const Text('Detalhes da Receita')),
        body: Column(
      children: [
            Text(receita.titulo),
            Image.network(receita.foto),
            Expanded(child: 
            ListView.builder(
              itemCount: receita.ingredientes.length,
              itemBuilder: (context, index) {
                final ingrediente = receita.ingredientes[index];
                return Row ( children: [
                  Text(ingrediente.name),
                  Text(ingrediente.quantity.toString())
                ]
                );
              }
            ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: receita.passos.length,
                itemBuilder: (context, index) {
                  final passo = receita.passos[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${index + 1}. "),
                      Expanded(
                        child: Text(passo), 
                      ),
                    ],
                  );
                },
              ),
            ),
             Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage.isNotEmpty
                    ? Center(child: Text(_errorMessage, style: const TextStyle(color: Colors.red)))
                    : _dbIngredients.isEmpty
                        ? const Center(child: Text('Nenhum ingrediente encontrado na DB.'))
                        : ListView.builder(
                            itemCount: _dbIngredients.length,
                            itemBuilder: (context, index) {
                              final ingredient = _dbIngredients[index];
                              return Card(
                                margin: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: const Color(0xFF1B4D3E),
                                    child: Text(
                                      ingredient['id_receita'].toString(),
                                      style: const TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                  title: Text(
                                    ingredient['titulo'] ?? 'Sem nome',
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                               
                                ),
                              );
                            },
                          ),
             )
            
          ],
        )
      ),
    );
  }
}
