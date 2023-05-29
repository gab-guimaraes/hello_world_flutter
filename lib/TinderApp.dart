import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(TinderApp());
}

class TinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TinderHomePage(),
    );
  }
}

class TinderHomePage extends StatefulWidget {
  @override
  _TinderHomePageState createState() => _TinderHomePageState();
}

class People {
  late String image;
  late String name;
  late String description;
  late String city;
  late String country;

  People(
      {required this.name,
      required this.image,
      required this.description,
      required this.city,
      required this.country});
}

class _TinderHomePageState extends State<TinderHomePage> {
  List<People> people2 = [
    People(
        name: 'Megan fox',
        image: 'assets/person1.png',
        description: 'Ola sou atriz e modelo americana',
        city: 'California',
        country: 'EUA'),
    People(
        name: 'Dua lipa',
        image: 'assets/person2.png',
        description: 'A procura de um grande amor',
        city: 'Londres',
        country: 'Inglaterra'),
    People(
        name: 'Vin diesel',
        image: 'assets/person3.png',
        description: 'Só quero sair correndo com meu carro, vamos comigo gata?',
        city: 'Sao Paulo',
        country: 'Brasil')
  ];

  int currentIndex = 0;

  void likePerson() {
    // Lógica para quando o botão de like é pressionado
    // Neste exemplo, apenas avança para a próxima pessoa
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(40.0),
          backgroundColor: Colors.black,
          title: Text('Você deu match! 🔥🔥',
              style: TextStyle(color: Colors.white)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('fechar'),
            ),
          ],
        );
      },
    );

    setState(() {
      currentIndex = (currentIndex + 1) % people2.length;
      //lenght = 5
      //currentIndex = 4
      //4+1 % = 0
    });
  }

  void dislikePerson() {
    // Lógica para quando o botão de dislike é pressionado
    // Neste exemplo, apenas avança para a próxima pessoa
    setState(() {
      currentIndex = (currentIndex + 1) % people2.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Love Swipe',
          style: TextStyle(
              fontSize: 34,
              fontFamily: 'RobotoSlab',
              color: Colors.amberAccent),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              people2[currentIndex].image,
              width: 300,
              height: 300,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              width: 300,
              child: Card(
                color: Colors.transparent,
                elevation: 4, // Define a elevação do card (sombra)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Define o raio de borda do card
                ),
                child: Column(
                  children: [
                    Text(
                      "${people2[currentIndex].name} | ${people2[currentIndex].city} - ${people2[currentIndex].country}",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "RobotoSlab"),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Text(
                      "${people2[currentIndex].description}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "RobotoSlab",
                          color: Colors.white70),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 0, height: 100),
                ElevatedButton(
                  onPressed: likePerson,
                  child: Icon(Icons.local_fire_department_outlined),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                ),
                const SizedBox(width: 50),
                ElevatedButton(
                  onPressed: dislikePerson,
                  child: Icon(Icons.cancel_rounded),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white24,
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black87,
        backgroundColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Brincar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Mensagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
