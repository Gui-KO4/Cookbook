import 'package:flutter/material.dart';

void main() => runApp(const RegisterPage());

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => RegisterForm();
}

class RegisterForm extends State<RegisterPage> {
  final registerKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  

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
          child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
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
              padding: EdgeInsets.all(24),
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child:Image.network(
                    "https://raw.githubusercontent.com/Gui-KO4/Cookbook/main/.github/assets/CookBook_mainlogo.png",
                    height: 120,
                  ),
                  ),
                  SizedBox(width: 8),
                    Expanded(
                      child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bem vindo,", style: TextStyle(fontSize: 12)),
                      Text(
                        "Junte-se ao CookBook",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                      )
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
              padding: EdgeInsets.all(20),
              child: Form(
                key: registerKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username", style: TextStyle(fontSize: 14)),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "Escreva o seu username",
                        filled: true,
                        fillColor: Color(0xFFEEF1EA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.soup_kitchen_outlined
                        )
                      ),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return "Escreva o seu username";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 4),

                    Text("Email", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),

                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Escreva o seu email",
                        filled: true,
                        fillColor: Color(0xFFEEF1EA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.mail_outline_rounded)
                      ),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return "escreva o seu email";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 4),
                    Text("Password", style: TextStyle(fontSize: 14)),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Escreva a sua password",
                        filled: true,
                        fillColor: Color(0xFFEEF1EA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),prefixIcon: Icon(Icons.lock_outlined)
                      ),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return "escreva a sua password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25),

                    Container(
                      //container dos botoes
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 300,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 27, 79, 64),
                                foregroundColor: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                              ),
                              onPressed: () {
                                if (registerKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, '/');
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Criar Conta'),
                                  SizedBox(width: 5),
                                  Icon(Icons.arrow_right_alt),
                                ],
                              ),
                            ),
                          ),
                           SizedBox(height: 12),
                          TextButton(
                            style: TextButton.styleFrom(foregroundColor: const Color.fromARGB(255, 27, 79, 64)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text("Já tem conta? faça login"),
                          ),
                              ]
                            )
                          ),
                  ],
                ),
              ),
            ),
             SizedBox(height: 20),
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
                ),
                      ),
                    ),
          ],
      ),
      ),
    )
      )
    );
  }
}