import 'package:flutter/material.dart';
import '../Widgets/colorTile.dart';

List<Image> images = [
  const Image(image: NetworkImage('https://picsum.photos/512')),
  const Image(image: AssetImage('images/monument.jpg')),
  const Image(image: AssetImage('images/forest.jpg')),
  const Image(image: AssetImage('images/desk.jpg')),
  const Image(image: AssetImage('images/pelicans.jpg')),
  const Image(image: AssetImage('images/bridge.jpg')),
  const Image(image: AssetImage('images/waterfall.jpg')),
];

class ImageSelector extends StatelessWidget {
  final Function imagePickedCallback;
  const ImageSelector({Key? key, required this.imagePickedCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Changer le plateau"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: images.length + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (ctx, item) {
            if (item == 0) {
              return InkWell(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (ctx, item) {
                    return ColorTile(item).display();
                  },
                ),
                onTap: () {
                  imagePickedCallback(null);
                  Navigator.pop(context);
                },
              );
            } else {
              return InkWell(
                child: Image(image: images[item - 1].image),
                onTap: () {
                  imagePickedCallback(images[item - 1].image);
                  Navigator.pop(context);
                },
                splashColor: Colors.blue,
              );
            }
          },
        ),
      ),
    );
  }
}
