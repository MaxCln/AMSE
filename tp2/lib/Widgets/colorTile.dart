import 'package:flutter/material.dart';
import 'dart:math';
import '../exercice7.dart';

class ColorTile extends Tile {
  int index = 0;
  Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  ColorTile(this.index);

  @override
  Widget display({void Function()? onTap}) {
    if (isEmpty) return const SizedBox.shrink(); //widget vide
    return InkWell(
      child: Container(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            index.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(70, 0, 0, 0),
            ),
          ),
        ),
        color: color,
      ),
      onTap: onTap,
    );
  }
}
