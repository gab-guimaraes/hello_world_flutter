import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/main.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const LoginPage(),
      '/home': (context) => MyApp(),
    },
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

  Widget _body() {
    return Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                width: 100,
                height: 100,
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Logo_TV_2015.png/250px-Logo_TV_2015.png')),
            const SizedBox(height: 30),
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
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    print('errado');
                  }
                },
                child: const Text('Entrar'))
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          drawer: const Drawer(),
            body: Stack(
              children: [
                Container(color: Colors.red),
                _body(),
              ],
            )
        )
    );
  }
}
