import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RecipeCard extends StatelessWidget {
  final String name;
  final String details;
  final String imgurl;
  final int time;
  final int rating;

  const RecipeCard({
    super.key,
    required this.name,
    required this.details,
    required this.imgurl,
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
          height: 400,
          child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
                  width: 400,
                  height: 200,
                  child: 
                    Image.network(imgurl, fit: BoxFit.fill,),
                ), 
                

                Container(
                padding: EdgeInsets.all(12),
                child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("CHOCO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                    Text("descriçao", style: TextStyle(fontSize: 14)),
                  ],
                )                
                ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: 
                          CircleAvatar(backgroundColor: Colors.amber),
                      ),
                      Expanded(
                        child: 
                          Text("User"),
                      ),
                      Expanded(
                        child: 
                          Icon(Icons.arrow_forward_ios)
                      ), 
                    ],
                  ),
                
              ],
            ),
        )
    );
  }
}
