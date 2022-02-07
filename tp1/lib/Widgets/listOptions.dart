import 'package:flutter/material.dart';
import 'package:tp1/mediaList.dart';
import '../models/media.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ListOptions extends StatefulWidget {
  List options;
  final Function() notifyType, notifyAlpha, notifyFav;

  ListOptions({Key? key, required this.notifyType, required this.notifyAlpha, required this.notifyFav,required this.options})
      : super(key: key);

  @override
  State<ListOptions> createState() => ListOptionsState(options);
}

class ListOptionsState extends State<ListOptions> {
  List options;

  ListOptionsState(this.options);

  Icon toast = Icon(Icons.sort);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: SpeedDial(
          childMargin: EdgeInsets.all(15), //margin bottom
          icon: Icons.menu, //icon on Floating action button
          activeIcon: Icons.close, //icon when menu is expanded on button
          //backgroundColor: Colors.deepOrangeAccent, //background color of button
          //foregroundColor: Colors.white, //font color, icon color in button
          //activeBackgroundColor: Colors.deepPurpleAccent, //background color when menu is expanded
          //activeForegroundColor: Colors.white,
          //buttonSize: 56.0, //button size
          visible: true,
          closeManually: true,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'), // action when menu opens
          onClose: () => print('DIAL CLOSED'), //action when menu closes
          elevation: 8.0, //shadow elevation of button
          shape: CircleBorder(), //shape of button

          children: [
            SpeedDialChild(
              //speed dial child
              child: Icon(Icons.sort),
              //backgroundColor: Colors.red,
              //foregroundColor: Colors.white,
              label: "Réorganiser",
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: widget.notifyType,
            ),
            SpeedDialChild(
              child: Icon(Icons.sort_by_alpha),
              label: "Dé/Croissant",
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: widget.notifyAlpha,
            ),
            SpeedDialChild(
              child: Icon(Icons.favorite_border),
              label: 'Favoris',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: widget.notifyFav,
            ),

            //add more menu item childs here
          ],
        ),
      ),
    );
  }
}
