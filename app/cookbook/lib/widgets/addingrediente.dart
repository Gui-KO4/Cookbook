import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ingredientCard extends StatelessWidget {
  final String name;
  final String type;
  final bool add;
  final int quantity;

  const ingredientCard({
    super.key,
    required this.name,
    required this.type,
    required this.add,
    required this.quantity,
  });
  

  void addIngredient(){

  }

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: 
      Column(
        children: [
          Row(
            children: [
              Checkbox(value: add, onChanged: (add) {
                
              }, ),
              Column(
                children: [
                  Text(name),
                  Text(type),
                ],
              )
            ],
          ),
          Row(
            children: [
              Text("Medida"),
              Spacer(flex: 12,),
              ElevatedButton(onPressed: () => {}, child: Text("-"),),
              Text(quantity.toString()),
              ElevatedButton(onPressed: () => {}, child: Text("+"))
            ],
          )
        ],
      ),
    );
  }
}
