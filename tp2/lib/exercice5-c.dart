import 'package:flutter/material.dart';
import 'Widgets/imageTile.dart';

class Exercice5c extends StatefulWidget {
  const Exercice5c({Key? key}) : super(key: key);

  @override
  State<Exercice5c> createState() => _Exercice5cState();
}

class _Exercice5cState extends State<Exercice5c> {
  int tiles = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Génération : tuiles d'image (variable)"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                child: GridView.builder(
                  itemCount: tiles * tiles,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: tiles,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (ctx, item) {
                    return ImageTile(
                            const AssetImage("images/monument.jpg"), tiles, item)
                        .display();
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  const Text("Taille :"),
                  Expanded(
                    child: Slider(
                      value: tiles.toDouble(),
                      min: 2,
                      max: 10,
                      divisions: 8,
                      label: tiles.toString(),
                      onChanged: (double value) {
                        setState(() {
                          tiles = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
