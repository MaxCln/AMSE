import 'package:flutter/material.dart';
import '../exercice7.dart';

class ImageTile extends Tile {
  ImageProvider image;
  int tiles = 0;
  int index = 0;

  ImageTile(this.image, this.tiles, this.index);

  @override
  Widget display({void Function()? onTap}) {
    if (isEmpty) return const SizedBox();
    return InkWell(
      child: FittedBox(
        fit: BoxFit.fill,
        child: ClipRect(
          child: Align(
            alignment: Alignment(2 * (index % tiles) / (tiles - 1) - 1,
                2 * (index ~/ tiles) / (tiles - 1) - 1),
            widthFactor: 1 / tiles,
            heightFactor: 1 / tiles,
            child: Image(image: image),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
