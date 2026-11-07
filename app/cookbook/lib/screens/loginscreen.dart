import 'package:flutter/material.dart';

import '../widgets/recipe.dart';

void main() => runApp(const LoginPage());

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => LoginForm();
}

class LoginForm extends State<LoginPage> {
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CookBook',
      theme: ThemeData(fontFamily: 'poppins'),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        //Widget la da intro
        body:SafeArea(
          child:Padding(
            padding:EdgeInsets.all(24),
            child:Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(239, 250, 251, 251),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
              Row(
                children: [
                  Image.network(
                    "https://raw.githubusercontent.com/Gui-KO4/Cookbook/main/.github/assets/CookBook_mainlogo.png",
                    height: 100,
                    width: 100
                  ),
                  SizedBox(width: 4),
                  Expanded(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bem vindo(a) de volta",
                        style: TextStyle(
                          fontSize: 22, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                  ),
                ],
              ),
            Text("Faça login para aceder as suas receitas",style: TextStyle(fontSize: 14)),
                ]
              )
            ),
            SizedBox(height: 10),
            Container(
              //Cena do formulario
              decoration: BoxDecoration(
                color: const Color.fromARGB(207, 255, 255, 255),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Form(
                key: loginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username", style: TextStyle(fontSize: 14)),
                    //talvez trocar por email depois
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Escreva o seu username",
                        filled: true,
                        fillColor: Color(0xFFEEF1EA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.soup_kitchen_outlined)
                      ),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return "Escreva o seu username";
                        }
                      },
                    ),
                    SizedBox(height: 4),
                    Text("Password", style: TextStyle(fontSize: 14)),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Escreva a sua password",
                        filled: true,
                        fillColor: Color(0xFFEEF1EA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      ),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return "escreva a sua password";
                        }
                      },
                    ),

                    
                    SizedBox(height: 20),

                    Container(
                      //container dos botoes
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 45,
                            width: 250,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 27, 79, 64),
                                foregroundColor: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                              ),
                              onPressed: () {
                                if (loginKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, '/');
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Fazer Login'),
                                  SizedBox(width: 10),
                                  Icon(Icons.person_2),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextButton(
                            style: TextButton.styleFrom(foregroundColor: Colors.black),
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text("Não tem conta? crie uma",style: TextStyle(decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 45,
                          width: 250,                
                         child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 246, 247, 242),
                              foregroundColor: Colors.black,
                              side: BorderSide(color: const Color.fromARGB(255, 189, 189, 189))
                            ),
                             onPressed: () =>
                                  Navigator.pushNamed(context, '/'),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.person),
                                 const SizedBox(width: 5),
                             const Text('Continuar como convidado'),
                              ]
                         )
                         ),
                    )
          ],
            ),
        ),
      ),
    )
      );
  }
}
