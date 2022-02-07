import 'package:flutter/material.dart';
import 'models/media.dart';

class About extends StatelessWidget {
  //const About({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Maxence COULON',
            style: TextStyle(
                fontFamily: 'Pacifico',
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Etudiant Ingénieur à IMT Nord Europe',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Card(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: Container(
              height: 35,
              width: MediaQuery.of(context).size.width * 0.65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.web),
                  SizedBox(width: 10),
                  Text(
                    'https://github.com/MaxCln',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
