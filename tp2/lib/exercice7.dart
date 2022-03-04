import 'package:flutter/material.dart';
import 'Widgets/imageTile.dart';
import 'Widgets/colorTile.dart';
import 'Screens/changeImage.dart';
import 'dart:math';

List<String> difficulties = [
  "Débutant",
  "Intermédiaire",
  "Avancé",
];

abstract class Tile {
  Widget display({void Function()? onTap});

  bool isEmpty = false;
  int index = 0;
}

class Exercice7 extends StatefulWidget {
  const Exercice7({Key? key}) : super(key: key);

  @override
  State<Exercice7> createState() => _Exercice7State();
}

class _Exercice7State extends State<Exercice7> {
  int tiles = 3, tempTiles = 3;

  late List<Tile> tileList = List<Tile>.generate(
      tiles * tiles,
      (index) =>
          image == null ? ColorTile(index) : ImageTile(image!, tiles, index));
  late int blankIndex = Random().nextInt(tiles * tiles);

  List<List<int>> moves = [], canceledMoves = [];

  int difficulty = 1;
  String game = "stop";

  ImageProvider? image;

  void initialize() {
    tiles = tempTiles;
    tileList = List<Tile>.generate(
        tiles * tiles,
        (index) =>
            image == null ? ColorTile(index) : ImageTile(image!, tiles, index));
    moves = [];
    canceledMoves = [];
    game = "stop";
  }

  void start() {
    int preset = 3 * (difficulty + 1) * tiles * tiles, random, emptyTile;
    Tile swapSwap;

    if (tileList.every((element) => !element.isEmpty)) {
      tileList[Random().nextInt(tiles * tiles)].isEmpty = true;
    }

    for (int i = 0; i < preset; i++) {
      random = Random().nextInt(4);
      emptyTile = tileList.indexWhere((element) => element.isEmpty);

      if (random == 0 && emptyTile - tiles >= 0) {
        swapSwap = tileList[emptyTile - tiles];
        tileList[emptyTile - tiles] = tileList[emptyTile];
        tileList[emptyTile] = swapSwap;
      } else if (random == 1 && emptyTile + tiles < tiles * tiles) {
        swapSwap = tileList[emptyTile + tiles];
        tileList[emptyTile + tiles] = tileList[emptyTile];
        tileList[emptyTile] = swapSwap;
      } else if (random == 2 && emptyTile % tiles > 0) {
        swapSwap = tileList[emptyTile - 1];
        tileList[emptyTile - 1] = tileList[emptyTile];
        tileList[emptyTile] = swapSwap;
      } else if (random == 3 && (emptyTile + 1) % tiles > 0) {
        swapSwap = tileList[emptyTile + 1];
        tileList[emptyTile + 1] = tileList[emptyTile];
        tileList[emptyTile] = swapSwap;
      }
    }
    game = "play";
  }

  swapTiles(int index) {
    Tile swapSwap = tileList[index];
    if (((index + 1) % tiles) > 0 && tileList[index + 1].isEmpty) {
      swapSwap = tileList[index + 1];
      tileList[index + 1] = tileList[index];
      moves.add([index, index + 1]);
    } else if ((index % tiles) > 0 && tileList[index - 1].isEmpty) {
      swapSwap = tileList[index - 1];
      tileList[index - 1] = tileList[index];
      moves.add([index, index - 1]);
    } else if ((index + tiles) < tiles * tiles &&
        tileList[index + tiles].isEmpty) {
      swapSwap = tileList[index + tiles];
      tileList[index + tiles] = tileList[index];
      moves.add([index, index + tiles]);
    } else if ((index - tiles) >= 0 && tileList[index - tiles].isEmpty) {
      swapSwap = tileList[index - tiles];
      tileList[index - tiles] = tileList[index];
      moves.add([index, index - tiles]);
    }
    tileList[index] = swapSwap;
    canceledMoves = [];
  }

  void cancelMove() {
    Tile swapSwap = tileList[moves.last[0]];
    tileList[moves.last[0]] = tileList[moves.last[1]];
    tileList[moves.last[1]] = swapSwap;
    canceledMoves.add([moves.last[1], moves.last[0]]);
    moves.removeLast();
  }

  void recoverMove() {
    Tile swapSwap = tileList[canceledMoves.last[0]];
    tileList[canceledMoves.last[0]] = tileList[canceledMoves.last[1]];
    tileList[canceledMoves.last[1]] = swapSwap;
    moves.add([canceledMoves.last[1], canceledMoves.last[0]]);
    canceledMoves.removeLast();
  }

  checkCompletion() {
    if (tileList
        .every((element) => element.index == tileList.indexOf(element))) {
      tileList[tileList.indexWhere((element) => element.isEmpty)].isEmpty =
          false;
      game = "over";
      if (image != null) {
        tempTiles = tiles;
        tiles = 1;
      }
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jeu de taquin"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(game == "play"
            ? Icons.stop
            : game == "over"
                ? Icons.replay
                : Icons.play_arrow),
        onPressed: () {
          setState(() {
            if (game == "stop") {
              start();
            } else {
              initialize();
            }
          });
        },
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
                    if (game == "over" && image != null) {
                      return Image(
                        image: image!,
                      );
                    } else
                      return tileList[item].display(
                        onTap: () {
                          if (game == "play") {
                            setState(() {
                              swapTiles(item);
                              checkCompletion();
                            });
                          }
                        },
                      );
                  },
                ),
              ),
              if (game == "stop")
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
                            tileList = List<Tile>.generate(
                              tiles * tiles,
                              (index) => image == null
                                  ? ColorTile(index)
                                  : ImageTile(image!, tiles, index),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              if (game == "stop")
                Row(
                  children: <Widget>[
                    const Text("Niveau :"),
                    Expanded(
                      child: Slider(
                        value: difficulty.toDouble(),
                        min: 0,
                        max: 2,
                        divisions: 2,
                        label: difficulties[difficulty],
                        onChanged: (double value) {
                          setState(() {
                            difficulty = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              if (game == "stop")
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) {
                            return ImageSelector(
                              imagePickedCallback: (ImageProvider? img) {
                                setState(() {
                                  image = img;
                                  initialize();
                                });
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: const Text("Changer le plateau"),
                  ),
                ),
              if (game == "play")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_circle_left_outlined),
                        color: Colors.white,
                        onPressed: moves.isEmpty
                            ? null
                            : () {
                                setState(
                                  () {
                                    cancelMove();
                                  },
                                );
                              },
                      ),
                    ),
                    Text("Coups :  ${moves.length}"),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_circle_right_outlined),
                        color: Colors.white,
                        onPressed: canceledMoves.isEmpty
                            ? null
                            : () {
                                setState(
                                  () {
                                    recoverMove();
                                  },
                                );
                              },
                      ),
                    ),
                  ],
                ),
              if (game == "over")
                const Text(
                  "Bien joué !",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              if (game == "over") Text("Résultat : ${moves.length} coups."),
            ],
          ),
        ),
      ),
    );
  }
}
