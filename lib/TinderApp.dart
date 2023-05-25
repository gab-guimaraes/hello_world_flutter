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

  People(this.name, this.image, this.description);
}

class _TinderHomePageState extends State<TinderHomePage> {

  List<People> people2 = [
    People('Megan fox', 'assets/person1.png', 'Ola sou atriz e modelo americana'),
    People('Dua lipa', 'assets/person2.png', 'A procura de um grande amor'),
    People('Vin diesel', 'assets/person3.png', 'Só quero sair correndo com meu carro, vamos comigo gata?')
  ];

  int currentIndex = 0;

  void likePerson() {
    // Lógica para quando o botão de like é pressionado
    // Neste exemplo, apenas avança para a próxima pessoa
    setState(() {
      currentIndex = (currentIndex + 1) % people2.length;
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
        title: const Text('Love Swipe', style: TextStyle(fontSize: 34, fontFamily: 'RobotoSlab', color:Colors.amberAccent),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              people2[currentIndex].image,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 15,
              height: 10,
            ),
            Card(
              color: Colors.transparent,
              elevation: 4, // Define a elevação do card (sombra)
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Define o raio de borda do card
              ),
              child: Padding(
                padding: EdgeInsets.all(16), // Define o espaçamento interno do card
                child: Text(
                  people2[currentIndex].name + ": " + people2[currentIndex].description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: likePerson,
                  child: Icon(Icons.thumb_up_rounded),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                ),
                const SizedBox(width: 50),
                ElevatedButton(
                  onPressed: dislikePerson,
                  child: Icon(Icons.thumb_down_rounded),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),),],),
          ],
        ),
      ),
    );
  }
}
