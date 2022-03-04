import 'package:flutter/material.dart';
import 'Widgets/imageTile.dart';

class Exercice5b extends StatelessWidget {
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
          return ImageTile(const AssetImage("images/monument.jpg"), 3, item)
              .display();
        },
      ),
    );
  }
}
