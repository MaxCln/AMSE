import 'package:flutter/material.dart';
import 'Models/menu.dart';
import 'exercice1.dart';
import 'exercice2.dart';
import 'exercice4.dart';
import 'exercice5-a.dart';
import 'exercice5-b.dart';
import 'exercice5-c.dart';
import 'exercice6-a.dart';
import 'exercice6-b.dart';
import 'exercice7.dart';

List<MenuTile> menu = [
  MenuTile(
      title: "Exercice 1",
      description: "Afficher une image",
      exercise: const Exercice1()),
  MenuTile(
      title: "Exercice 2",
      description: "Transformer une image",
      exercise: const Exercice2()),
  MenuTile(
      title: "Exercice 4",
      description: "Affichage d'une tuile (un morceau d'image)",
      exercise: Exercice4()),
  MenuTile(
      title: "Exercice 5-a",
      description: "Génération du plateau de tuiles colorées (taille fixe)",
      exercise: const Exercice5a()),
  MenuTile(
      title: "Exercice 5-b",
      description: "Génération du plateau de tuiles d'image (taille fixe)",
      exercise: Exercice5b()),
  MenuTile(
      title: "Exercice 5-c",
      description: "Génération du plateau de tuiles d'image (taille configurable)",
      exercise: const Exercice5c()),
  MenuTile(
      title: "Exercice 6-a",
      description: "Animation d'une tuile (duo)",
      exercise: const Exercice6a()),
  MenuTile(
      title: "Exercice 6-b",
      description: "Animation d'une tuile (plateau)",
      exercise: const Exercice6b()),
  MenuTile(
      title: "Exercice 7",
      description: "Jeu de taquin",
      exercise: const Exercice7()),
];

class Exercice3 extends StatelessWidget {
  const Exercice3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AMSE - Flutter : TP2"),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (ctx, exItem) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) {
                      return menu[exItem].exercise;
                    },
                  ),
                );
              },
              child: ListTile(
                title: Text(menu[exItem].title),
                subtitle: Text(menu[exItem].description),
                trailing: const Icon(Icons.arrow_right),
              ),
            ),
          );
        },
      ),
    );
  }
}
