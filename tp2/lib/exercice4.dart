import 'package:flutter/material.dart';
import 'Widgets/imageTile.dart';

class Exercice4 extends StatelessWidget {
  ImageTile tile = ImageTile(const AssetImage("images/monument.jpg"), 5, 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affichage d'une tuile"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Container(
                  child: tile.display(
                    onTap: () {
                      print("tapped on tile");
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Image(
                image: AssetImage("images/monument.jpg"),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
