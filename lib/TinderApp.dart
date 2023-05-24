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

  People(this.name, this.image);
}

class _TinderHomePageState extends State<TinderHomePage> {

  List<People> people2 = [
    People('Megan fox', 'assets/person1.png'),
    People('Dua lipa', 'assets/person2.png'),
    People('Vin diesel', 'assets/person3.png')
  ];

  int currentIndex = 0;

  void likePerson() {
    // Lógica para quando o botão de like é pressionado
    // Neste exemplo, apenas avança para a próxima pessoa
    setState(() {
      currentIndex = (currentIndex + 1) % people.length;
    });
  }

  void dislikePerson() {
    // Lógica para quando o botão de dislike é pressionado
    // Neste exemplo, apenas avança para a próxima pessoa
    setState(() {
      currentIndex = (currentIndex + 1) % people.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tinder do mal 🔥'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              people2[currentIndex].name,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              width: 32,
              height: 30,
            ),
            Image.asset(
              people2[currentIndex].image,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 32,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: likePerson,
                  child: Icon(Icons.thumb_up),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: dislikePerson,
                  child: Icon(Icons.thumb_down),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
