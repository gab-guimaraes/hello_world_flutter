import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/main.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Material(
                child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Welcome', style: TextStyle(fontSize: 30)),
        const SizedBox(height: 40),
        TextField(
            onChanged: (text) {
              email = text;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                labelText: 'Email', border: OutlineInputBorder())),
        const SizedBox(height: 10),
        TextField(
          onChanged: (text) {
            password = text;
          },
          obscureText: true,
          decoration: const InputDecoration(
              labelText: 'Senha', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () {
              if (email == "dedito182@gmail.com" && password == "@blink182") {
                print('correto');
                Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => MyApp()));
              } else {
                print('errado');
              }
            },
            child: const Text('Entrar'))
      ]),
    ))));
  }
}
