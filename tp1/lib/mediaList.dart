import 'package:flutter/material.dart';
import 'models/media.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MediaList extends StatefulWidget {
  @override
  State<MediaList> createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  final List<Media> _myMedia = [
    Media(
      id: 1,
      type: "movie",
      name: "Alien",
      chapter: 1,
      completed: "Complété",
      rating: 4.0,
      image: "../images/alien-poster.jpg",
      favorite: false,
    ),
    Media(
      id: 2,
      type: "movie",
      name: "Film 2",
      chapter: 3,
      completed: "En-cours",
      rating: 1.5,
      image: "",
      favorite: true,
    ),
    Media(
      id: 3,
      type: "book",
      name: "Livre 1",
      chapter: 6,
      completed: "Prévu",
      rating: 3.5,
      image: "",
      favorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _myMedia.length,
      itemBuilder: (ctx, media) {
        var mediaImage;
        Icon mediaFav = Icon(Icons.favorite_border);

        // Remplacer l'image par une icône si non renseigné
        if (_myMedia[media].image != "") {
          mediaImage = Image.asset(
            _myMedia[media].image,
            scale: 0.1,
          );
        } else if (_myMedia[media].type == "book")
          mediaImage = Icon(Icons.book);
        else if (_myMedia[media].type == "movie")
          mediaImage = Icon(Icons.movie);

        // Utiliser l'icône favoris correspondante
        if (_myMedia[media].favorite == true) mediaFav = Icon(Icons.favorite);

        return Card(
          child: Column(
            children: <Widget>[
              ExpansionTile(
                /*tilePadding: EdgeInsets.only(left: 40, right: 25, top: 50, bottom : 10),*/
                leading: /*Transform.scale(
                  scale: 3,
                  child:*/ mediaImage,
                //),
                title: Text(_myMedia[media].name),
                subtitle: RatingBarIndicator(
                  rating: _myMedia[media].rating,
                  itemBuilder: (
                    context,
                    index,
                  ) =>
                      Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                ),
                children: <Widget>[
                  Text("Synopsis : "),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Status : ${_myMedia[media].completed}"),
                      Text("Avancement : ${_myMedia[media].chapter}"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Avis : "),
                  SizedBox(height: 20),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      return;
                    },
                    child: const Text("Editer"),
                  ),
                  IconButton(
                    icon: mediaFav,
                    tooltip: 'Favoris',
                    onPressed: () {
                      if (_myMedia[media].favorite == true)
                        _myMedia[media].favorite = false;
                      else if (_myMedia[media].favorite == false)
                        _myMedia[media].favorite = true;
                      setState(() {
                        if (_myMedia[media].favorite == true)
                          mediaFav = Icon(Icons.favorite);
                        else if (_myMedia[media].favorite == false)
                          mediaFav = Icon(Icons.favorite_border);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
