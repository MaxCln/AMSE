import 'package:flutter/material.dart';

class Exercice1 extends StatelessWidget {
  const Exercice1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Afficher une image")),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Image(
          image: AssetImage("images/monument.jpg"),
        ),
      ),
    );
  }
}
