import 'package:flutter/material.dart';

import '../widgets/recipe.dart';

void main() => runApp(const RegisterPage());

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => RegisterForm();
}

class RegisterForm extends State<RegisterPage> {
  final registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CookBook',
      theme: ThemeData(fontFamily: 'poppins'),
      home: Scaffold(
        //Widget la da intro
        body: Column(
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
              width: 400,
              height: 100,
              padding: EdgeInsets.all(24),
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  Image.network(
                    "https://raw.githubusercontent.com/Gui-KO4/Cookbook/main/.github/assets/CookBook_mainlogo.png",
                    width: 100,
                    height: 120,
                  ),
                  SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome,", style: TextStyle(fontSize: 12)),
                      Text(
                        "Join CookBook",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
              width: 400,
              height: 480,
              padding: EdgeInsets.all(20),
              child: Form(
                key: registerKey,
                child: Column(
                  children: [
                    Text("Username", style: TextStyle(fontSize: 14)),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Escreva o seu username",
                        filled: true,
                        fillColor: Color(0xFFEEF1EA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (valor) {
                        if (valor == null || valor.trim().isEmpty) {
                          return "Escreva o seu username";
                        }
                        if (valor.length < 3) {
                          return "O nome tem de ter pelo menos 3 caracteres";
                        }
                      },
                    ),
                    SizedBox(height: 4),

                    Text("Email", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Escreva o seu email",
                        filled: true,
                        fillColor: Color(0xFFEEF1EA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (valor) {
                        if (valor == null || valor.trim().isEmpty) {
                          return "escreva o seu email";
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
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      ),
                      validator: (valor) {
                        if (valor == null || valor.trim().isEmpty) {
                          return "escreva a sua password";
                        }
                        if (valor.length < 8) {
                          return "Pelo menos 8 caracteres";
                        }
                      },
                    ),
                    SizedBox(height: 10),

                    Container(
                      //container dos botoes
                      height: 100,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(210, 11, 62, 9),
                                foregroundColor: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/login'),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Criar Conta'),
                                  SizedBox(width: 10),
                                  Icon(Icons.person),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {
                              if (registerKey.currentState!.validate()) {}
                            },
                            child: const Text('Continuar como convidado'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
