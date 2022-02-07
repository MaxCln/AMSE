import 'package:flutter/material.dart';
import 'package:tp1/main.dart';
import 'models/media.dart';
import 'Widgets/listOptions.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:dropdown_below/dropdown_below.dart';

class MediaList extends StatefulWidget {
  final List<Media> _myMedia;

  MediaList(this._myMedia);

  @override
  State<MediaList> createState() => _MediaListState(_myMedia);
}

class _MediaListState extends State<MediaList> {
  _MediaListState(this._myMedia);

  sortType() {
    setState(() {
      switch (_sortOptions[0]) {
        case "name":
          print("rating");
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => b.rating.compareTo(a.rating));
          } else {
            _filteredList.sort((a, b) => a.rating.compareTo(b.rating));
          }
          _sortOptions[0] = "rating";
          break;

        case "rating":
          print("type");
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => a.type.compareTo(b.type));
          } else {
            _filteredList.sort((a, b) => b.type.compareTo(a.type));
          }
          _sortOptions[0] = "type";
          break;

        case "type":
          print("completed");
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => a.completed.compareTo(b.completed));
          } else {
            _filteredList.sort((a, b) => b.completed.compareTo(a.completed));
          }
          _sortOptions[0] = "completed";
          break;

        case "completed":
          print("name");
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => a.name.compareTo(b.name));
          } else {
            _filteredList.sort((a, b) => b.name.compareTo(a.name));
          }
          _sortOptions[0] = "name";
          break;
      }
    });
  }

  sortAlpha() {
    setState(() {
      switch (_sortOptions[0]) {
        case "name":
          print(_sortOptions[0]);
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => b.name.compareTo(a.name));
            _sortOptions[1] = "décroissant";
          } else {
            _filteredList.sort((a, b) => a.name.compareTo(b.name));
            _sortOptions[1] = "croissant";
          }
          break;

        case "rating":
          print(_sortOptions[0]);
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => a.rating.compareTo(b.rating));
            _sortOptions[1] = "décroissant";
          } else {
            _filteredList.sort((a, b) => b.rating.compareTo(a.rating));
            _sortOptions[1] = "croissant";
          }
          break;

        case "type":
          print(_sortOptions[0]);
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => b.type.compareTo(a.type));
            _sortOptions[1] = "décroissant";
          } else {
            _filteredList.sort((a, b) => a.type.compareTo(b.type));
            _sortOptions[1] = "croissant";
          }
          break;

        case "completed":
          print(_sortOptions[0]);
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => b.completed.compareTo(a.completed));
            _sortOptions[1] = "décroissant";
          } else {
            _filteredList.sort((a, b) => a.completed.compareTo(b.completed));
            _sortOptions[1] = "croissant";
          }
          break;
      }
    });
  }

  sortFav() {
    setState(() {
      if (favoriteOnly) {
        favoriteOnly = false;
        _filteredList = _myMedia.toList();
      } else {
        favoriteOnly = true;
        _filteredList =
            _myMedia.where((sort) => sort.favorite == true).toList();
      }

      switch (_sortOptions[0]) {
        case "name":
          print(_sortOptions[0]);
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => a.name.compareTo(b.name));
          } else {
            _filteredList.sort((a, b) => b.name.compareTo(a.name));
          }
          break;

        case "rating":
          print(_sortOptions[0]);
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => b.rating.compareTo(a.rating));
          } else {
            _filteredList.sort((a, b) => a.rating.compareTo(b.rating));
          }
          break;

        case "type":
          print(_sortOptions[0]);
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => a.type.compareTo(b.type));
          } else {
            _filteredList.sort((a, b) => b.type.compareTo(a.type));
          }
          break;

        case "completed":
          print(_sortOptions[0]);
          if (_sortOptions[1] == "croissant") {
            _filteredList.sort((a, b) => a.completed.compareTo(b.completed));
          } else {
            _filteredList.sort((a, b) => b.completed.compareTo(a.completed));
          }
          break;
      }
    });
  }

  final List _sortOptions = ["name", "croissant"];
  bool favoriteOnly = false;
  bool init = true;

  final List<Media> _myMedia;
  late List<Media> _filteredList = _myMedia.toList();

  @override
  Widget build(BuildContext context) {
    if (init) {
      _filteredList.sort((a, b) => a.name.compareTo(b.name));
      init = false;
    }
    return Stack(
      children: [
        ListView.builder(
          itemCount: _filteredList.length,
          itemBuilder: (ctx, media) {
            var mediaImage;
            Icon mediaFav = Icon(Icons.favorite_border);

            // Remplacer l'image par une icône si non renseigné
            if (_filteredList[media].image != "") {
              mediaImage = Image.asset(
                _filteredList[media].image,
                scale: 0.1,
              );
            } else if (_filteredList[media].type == "novel")
              mediaImage = Icon(Icons.book);
            else if (_filteredList[media].type == "movie")
              mediaImage = Icon(Icons.movie);

            // Utiliser l'icône favoris correspondante
            if (_filteredList[media].favorite == true)
              mediaFav = Icon(Icons.favorite);

            return Card(
              child: Column(
                children: <Widget>[
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(
                        left: 60, right: 25, top: 50, bottom: 50),
                    leading: Transform.scale(
                        scale: 3,
                        child: Container(
                            width: 50,
                            child: Row(children: <Widget>[
                              mediaImage,
                            ]))),
                    title: Text(_filteredList[media].name),
                    subtitle: RatingBarIndicator(
                      rating: _filteredList[media].rating,
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
                    childrenPadding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                const TextSpan(
                                    text: "Status : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "${_filteredList[media].completed}"),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                const TextSpan(
                                    text: "Avancement : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "${_filteredList[media].chapter}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            const TextSpan(
                                text: "Synopsis : ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: "${_filteredList[media].synopsis}"),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            const TextSpan(
                                text: "Avis : ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: "${_filteredList[media].review}"),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  IconButton(
                    icon: mediaFav,
                    tooltip: 'Favoris',
                    onPressed: () {
                      if (_filteredList[media].favorite == true)
                        _filteredList[media].favorite = false;
                      else if (_filteredList[media].favorite == false)
                        _filteredList[media].favorite = true;
                      setState(
                        () {
                          if (_filteredList[media].favorite == true)
                            mediaFav = Icon(Icons.favorite);
                          else if (_filteredList[media].favorite == false)
                            mediaFav = Icon(Icons.favorite_border);
                          if (favoriteOnly) {
                            _filteredList = _myMedia
                                .where((sort) => sort.favorite == true)
                                .toList();
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
        ListOptions(
            notifyType: sortType,
            notifyAlpha: sortAlpha,
            notifyFav: sortFav,
            options: _sortOptions),
      ],
    );
  }
}
