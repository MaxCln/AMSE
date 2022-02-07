import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'models/media.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Profile extends StatelessWidget {
  final List<Media> _myMedia;

  Profile(this._myMedia);

  int completed = 0, ptw = 0, onHold = 0, inProgress = 0, movie = 0, novel = 0, anime = 0, videogame = 0, totalEntry = 0;
  double averageRating = 0.0;

  getChart() {
    completed = _myMedia.where((e) => e.completed == "Complété").length;
    ptw = _myMedia.where((e) => e.completed == "Prévu").length;
    onHold = _myMedia.where((e) => e.completed == "En pause").length;
    inProgress = _myMedia.where((e) => e.completed == "En cours").length;

    
    movie = _myMedia.where((e) => e.type == "movie").length;
    novel = _myMedia.where((e) => e.type == "novel").length;
    anime = _myMedia.where((e) => e.type == "anime").length;
    videogame = _myMedia.where((e) => e.type == "videogame").length;

    totalEntry = _myMedia.length;
    averageRating = _myMedia.map((e) => e.rating).average;
  }

  late List<ChartData> typeData = [
    ChartData(
      "",
      movie,
      anime,
      novel,
      videogame,
    ),
  ];

  late List<ChartData> statusData = [
    ChartData(
      "",
      completed,
      inProgress,
      onHold,
      ptw,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    getChart();
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 35, right: 50, bottom: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        const TextSpan(
                            text: "Note moyenne : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "${averageRating.toStringAsFixed(1)}/5"),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        const TextSpan(
                            text: "Entrées totales : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "$totalEntry"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.015),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  title: AxisTitle(text: "Type"),
                ),
                palette: <Color>[
                  Colors.blue,
                  Colors.green,
                  Colors.red,
                  Colors.purple
                ],
                series: <ChartSeries>[
                  StackedBar100Series<ChartData, String>(
                      dataSource: typeData,
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y1),
                  StackedBar100Series<ChartData, String>(
                      dataSource: typeData,
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y2),
                  StackedBar100Series<ChartData, String>(
                      dataSource: typeData,
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y3),
                  StackedBar100Series<ChartData, String>(
                      dataSource: typeData,
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y4)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Icon(
                    Icons.circle,
                    color: Colors.blue,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: "Film(s)",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 56),
                  Text("$movie"),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: "Anime",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 74),
                  Text("$anime"),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Icon(
                    Icons.circle,
                    color: Colors.red,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: "Roman(s)",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 38),
                  Text("$novel"),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Icon(
                    Icons.circle,
                    color: Colors.purple,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: "Jeu(x)-vidéo",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 38),
                  Text("$videogame"),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.025),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  title: AxisTitle(text: "Statut"),
                ),
                palette: <Color>[
                  Colors.blue,
                  Colors.green,
                  Colors.red,
                  Colors.purple
                ],
                series: <ChartSeries>[
                  StackedBar100Series<ChartData, String>(
                      dataSource: statusData,
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y1),
                  StackedBar100Series<ChartData, String>(
                      dataSource: statusData,
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y2),
                  StackedBar100Series<ChartData, String>(
                      dataSource: statusData,
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y3),
                  StackedBar100Series<ChartData, String>(
                      dataSource: statusData,
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y4)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Icon(
                    Icons.circle,
                    color: Colors.blue,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: "Complété(s)",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 38),
                  Text("$completed"),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: "En cours",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 38),
                  Text("$inProgress"),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Icon(
                    Icons.circle,
                    color: Colors.red,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: "En pause",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 58),
                  Text("$onHold"),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Icon(
                    Icons.circle,
                    color: Colors.purple,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: "Prévu(s)",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  Text("$ptw"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final int y1;
  final int y2;
  final int y3;
  int y4;

  ChartData(
    this.x,
    this.y1,
    this.y2,
    this.y3,
    this.y4,
  );
}
