import 'package:flutter/material.dart';
import 'Widgets/colorTile.dart';

class Exercice6a extends StatefulWidget {
  const Exercice6a({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Exercice6aState();
}

class Exercice6aState extends State<Exercice6a> {
  List<ColorTile> tiles =
      List<ColorTile>.generate(2, (index) => ColorTile(index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation d'une tuile"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.compare_arrows_sharp),
        onPressed: swapTiles,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: tiles.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: tiles.length,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (ctx, item) {
          return tiles[item].display();
        },
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
