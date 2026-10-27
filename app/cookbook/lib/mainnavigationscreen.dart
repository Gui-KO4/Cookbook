import 'package:flutter/material.dart';
import 'screens/feed.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _SelectedIndex = 0;

  final List<Widget> _screens = const [
    FeedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          leading: IconButton( icon: Icon(Icons.search), onPressed: () => {},),
          title: Center(child: Text("CookBook", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 34), )),
          actions: [IconButton(onPressed: () =>{}, icon: Icon(Icons.person))],
        ),

      body: _screens[_SelectedIndex],
      
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 100,
        padding: EdgeInsets.all(12),        
          child:
              Card.outlined(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 2,
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_outlined),
                        Text("home")
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book_outlined),
                        Text("CookBook")
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined),
                        Text("Shopping list")
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map_outlined),
                        Text("Map")
                      ],
                    ),


                  ],
                ),
              )  
          ),
    );
  }

}