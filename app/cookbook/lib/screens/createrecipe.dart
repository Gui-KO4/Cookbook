import 'package:flutter/material.dart';
import '/widgets/addingrediente.dart';

class Ingrediente{
  final String name;
  final String type;
  final bool add;
  final int quantity;
  const Ingrediente(this.name, this.type, this.add, this.quantity,);
}

const types = [
  "arroz",
  "feijao",
  "mambo",
  "rastoz",
  "cooisa"
];

const ingredientes = [
  Ingrediente("name", "type", true, 4)
];
class CreateRecipeScreen extends StatelessWidget {
  const CreateRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Step 1 of 2 ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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

          const SearchBar(hintText: ("Procurar"),),

          const SizedBox(height: 12),
          
              SizedBox(
                height: 32,
                child: 
                ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: types.length,
                  itemBuilder: (context, index){
                    final type = types[index];
                    return 
                    Container(
                    padding: EdgeInsets.only(right: 4),  
                    child: 
                      ElevatedButton(
                        onPressed: ()=>{}, 
                        child:
                          Text(type),
                      ),
                    );
                  }
                  
                  )
              ),
            
          const SizedBox(height: 12),
          
          Expanded(
            child: ListView.builder(
              itemCount: ingredientes.length,
              itemBuilder: (context, index) {
                final ingrediente = ingredientes[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
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