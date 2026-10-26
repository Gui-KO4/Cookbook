import 'package:flutter/material.dart';
import 'widgets/recipe.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CookBook',
      theme: ThemeData(
        fontFamily: 'poppins',
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton( icon: Icon(Icons.search), onPressed: () => {},),
          title: Center(child: Text("CookBook", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 34), )),
          actions: [IconButton(onPressed: () =>{}, icon: Icon(Icons.person))],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(24),
                child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Today's Kitchen feed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28), softWrap: true,),
                  ],),),    
                  SizedBox(width: 12,),
                  ElevatedButton.icon(onPressed: () => {}, label: Text("24 New"), icon: Icon(Icons.auto_awesome), style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(186, 238, 217, 100), foregroundColor: Colors.black),),
                ]
              )
            ),
            Text("Fresh artisanal recipes tailored for you",style: TextStyle(fontFamily: 'Plus Jakarta Sans', fontSize: 14), softWrap: true,),
            RecipeCard(name: "yurr",details:  "yurr",time: 1,rating: 2),
            ],
          ),
        ),
      ),
    );
  }
}
