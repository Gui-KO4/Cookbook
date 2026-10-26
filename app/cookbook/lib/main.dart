import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton( icon: Icon(Icons.search), onPressed: () => {},),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Today's Kitchen feed"),
                      Text("Fresh artisanal recipes tailored for you", softWrap: true,)
                  ],),),    
                  SizedBox(width: 12,),
                  ElevatedButton.icon(onPressed: () => {}, label: Text("")),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
