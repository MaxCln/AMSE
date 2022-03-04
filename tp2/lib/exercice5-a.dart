import 'package:flutter/material.dart';
import 'Widgets/colorTile.dart';

class Exercice5a extends StatelessWidget {
  const Exercice5a({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Génération : tuiles colorées"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (ctx, item) {
          return ColorTile(item).display();
        },
      ),
    );
  }
}
