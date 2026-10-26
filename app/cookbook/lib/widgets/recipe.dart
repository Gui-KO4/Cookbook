import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String name;
  final String details;
  final int time;
  final int rating;

  const RecipeCard({
    super.key,
    required this.name,
    required this.details,
    required this.time,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: 2, 
      child: 
        SizedBox(
          width: 400,
          height: 300,
          child: 
          Text("insano")
        )
    );
  }
}
