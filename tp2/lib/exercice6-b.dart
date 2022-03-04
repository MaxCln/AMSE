import 'package:flutter/material.dart';
import 'Widgets/colorTile.dart';
import 'dart:math';

class Exercice6b extends StatefulWidget {
  const Exercice6b({Key? key}) : super(key: key);

  @override
  State<Exercice6b> createState() => _Exercice6bState();
}

class _Exercice6bState extends State<Exercice6b> {
  int tiles = 3;
  late List<ColorTile> tileList =
      List<ColorTile>.generate(tiles * tiles, (index) => ColorTile(index));

  swapTiles(int index) {
    ColorTile swapSwap = tileList[index];
    if (((index + 1) % tiles) > 0 && tileList[index + 1].isEmpty) {
      swapSwap = tileList[index + 1];
      tileList[index + 1] = tileList[index];
    } else if ((index % tiles) > 0 && tileList[index - 1].isEmpty) {
      swapSwap = tileList[index - 1];
      tileList[index - 1] = tileList[index];
    } else if ((index + tiles) < tiles * tiles &&
        tileList[index + tiles].isEmpty) {
      swapSwap = tileList[index + tiles];
      tileList[index + tiles] = tileList[index];
    } else if ((index - tiles) >= 0 && tileList[index - tiles].isEmpty) {
      swapSwap = tileList[index - tiles];
      tileList[index - tiles] = tileList[index];
    }
    tileList[index] = swapSwap;
  }

  @override
  Widget build(BuildContext context) {
    if (tileList.every((element) => !element.isEmpty)) {
      tileList[Random().nextInt(tiles * tiles)].isEmpty = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation d'une tuile (plateau)"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width * 1,
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
                    return tileList[item].display(
                      onTap: () {
                        setState(() {
                          swapTiles(item);
                        });
                      },
                    );
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
                          tileList = List<ColorTile>.generate(
                              tiles * tiles, (index) => ColorTile(index));
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
