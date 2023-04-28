import 'package:flutter/material.dart';

main() {
  runApp(const AppWidget(
    title: 'Fast and Furious'
  ));
}

class AppWidget extends StatelessWidget {

  final String title;

  const AppWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        textDirection: TextDirection.ltr,
      )
    );
  }

}