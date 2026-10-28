import 'package:flutter/material.dart';
import '/widgets/addingrediente.dart';

class Ingrediente{
  final String name;
  final String type;
  final bool add;
  final int quantity;
  const Ingrediente(this.name, this.type, this.add, this.quantity,);
}

const ingredientes = [
  Ingrediente("name", "type", true, 4)
];
class CreateRecipeScreen extends StatelessWidget {
  const CreateRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          // 1. Cabeçalho (com tamanho natural, sem Expanded a esticar)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Step ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("Catalog", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Select Ingredients",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {},
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 2. Barra de pesquisa
          const SearchBar(),

          const SizedBox(height: 12),

          // 3. APENAS o ListView fica com Expanded para ocupar o espaço restante
          Expanded(
            child: ListView.builder(
              itemCount: ingredientes.length,
              itemBuilder: (context, index) {
                final ingrediente = ingredientes[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ingredientCard(
                    name: ingrediente.name,
                    type: ingrediente.type,
                    add: ingrediente.add,
                    quantity: ingrediente.quantity,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}