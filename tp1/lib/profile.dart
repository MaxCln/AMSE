import 'package:flutter/material.dart';
import 'models/media.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Text("Bienvenue dans votre Médiathèque\n\nTenez un journal de vos films, séries et livres favoris.\n\nRestez informé de votre progression.", textAlign: TextAlign.center,),
      ),
    );
  }
}
