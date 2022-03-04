import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class Exercice2 extends StatefulWidget {
  const Exercice2({Key? key}) : super(key: key);

  @override
  _Exercice2State createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  double xAxis = 0, zAxis = 0, scale = 1;
  bool mirror = false;

  bool playAnimation = false;
  late Timer timer;
  bool xTrigger = true, zTrigger = true, scaleTrigger = true;

  void animate(Timer timer) {
    setState(() {
      if (xAxis <= 0.01) xTrigger = true;
      if (xAxis >= pi - 0.01) xTrigger = false;

      if (zAxis <= 0.01) zTrigger = true;
      if (zAxis >= 2 * pi - 0.01) zTrigger = false;

      if (scale <= 0.11) scaleTrigger = true;
      if (scale >= 0.99) scaleTrigger = false;

      xTrigger ? xAxis += 0.01 : xAxis -= 0.01;
      zTrigger ? zAxis += 0.01 : zAxis -= 0.01;
      scaleTrigger ? scale += 0.01 : scale -= 0.01;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transformer une image")),
      floatingActionButton: FloatingActionButton(
        child: Icon(playAnimation ? Icons.pause : Icons.play_arrow),
        onPressed: () {
          setState(() {
            playAnimation = !playAnimation;
            if (playAnimation) {
              timer = Timer.periodic(const Duration(milliseconds: 50), animate);
            } else {
              timer.cancel();
            }
          });
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(xAxis)
                    ..rotateZ(zAxis)
                    ..rotateY(mirror ? pi : 0)
                    ..scale(scale),
                  child: const Image(
                    image: AssetImage("images/monument.jpg"),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  const Text("Axe X :"),
                  Expanded(
                    child: Slider(
                      value: xAxis,
                      min: 0,
                      max: pi,
                      onChanged: (double value) {
                        setState(() {
                          xAxis = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Text("Axe Z :"),
                  Expanded(
                    child: Slider(
                      value: zAxis,
                      min: 0,
                      max: 2 * pi,
                      onChanged: (double value) {
                        setState(() {
                          zAxis = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Text("Mirroir :"),
                  Checkbox(
                    value: mirror,
                    onChanged: (bool? value) {
                      setState(() {
                        mirror = value!;
                      });
                    },
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  const Text("Taille :"),
                  Expanded(
                    child: Slider(
                      value: scale,
                      min: 0.1,
                      max: 1,
                      onChanged: (double value) {
                        setState(() {
                          scale = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
