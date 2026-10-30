import 'package:flutter/material.dart';
import '/widgets/addingrediente.dart';
import '/widgets/navbar.dart';
import '/Models/ingredients.dart';
import 'createrecipestep2.dart';
import 'feed.dart';


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
    return MaterialApp(
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
          "CookBook",
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
      body:
        Padding(
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
                    onPressed: () {
                      Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => const FeedScreen(), // Replace with your destination screen
                            ),
                            );
                    },
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
              ElevatedButton(onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateRecipestep2Screen(), // Replace with your destination screen
                  ),
                )
              }, 
              child: 
              Text("next"),
              ),
            ],
          ),
        ),
        bottomNavigationBar: buildCookBookBottomNav(context, 1),
       )
    );
  }
}