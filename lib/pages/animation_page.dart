import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest> {
  int animationphase = 0;
  Color color = Colors.red;

  void startAnimation() {
    setState(() {
      animationphase++;
      if (animationphase == 4) animationphase = 0;
      if (animationphase == 1) {
        color = Colors.blue;
      } else if (animationphase == 2) {
        color = Colors.orange;
      } else if (animationphase == 3) {
        color = Colors.green;
      } else if (animationphase == 0) {
        color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Screen"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 3),
              alignment: animationphase == 0
                  ? Alignment.topLeft
                  : animationphase == 1
                      ? Alignment.bottomLeft
                      : animationphase == 2
                          ? Alignment.bottomRight
                          : animationphase == 3
                              ? Alignment.topRight
                              : Alignment.topLeft,
              child: Icon(
                Icons.home,
                size: 39,
                color: color,
              ),
            ),
            AnimatedContainer(
              duration: Duration(seconds: 3),
              alignment: animationphase == 0
                  ? Alignment.topRight
                  : animationphase == 1
                      ? Alignment.topLeft
                      : animationphase == 2
                          ? Alignment.bottomLeft
                          : animationphase == 3
                              ? Alignment.bottomRight
                              : Alignment.topRight,
              child: Icon(
                Icons.sports_soccer,
                size: 39,
                color: color,
              ),
            ),
            AnimatedContainer(
              duration: Duration(seconds: 3),
              alignment: animationphase == 0
                  ? Alignment.bottomLeft
                  : animationphase == 1
                      ? Alignment.bottomRight
                      : animationphase == 2
                          ? Alignment.topRight
                          : animationphase == 3
                              ? Alignment.topLeft
                              : Alignment.bottomLeft,
              child: Icon(
                Icons.explore,
                size: 39,
                color: color,
              ),
            ),
            AnimatedContainer(
              onEnd: () {
                startAnimation();
              },
              duration: Duration(seconds: 3),
              alignment: animationphase == 0
                  ? Alignment.bottomRight
                  : animationphase == 1
                      ? Alignment.topRight
                      : animationphase == 2
                          ? Alignment.topLeft
                          : animationphase == 3
                              ? Alignment.bottomLeft
                              : Alignment.bottomRight,
              child: Icon(
                Icons.terrain_rounded,
                size: 39,
                color: color,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    startAnimation();

                    //Timer(const Duration(seconds: 3), () => startAnimation());
                    // Timer(const Duration(seconds: 6), () => startAnimation());
                    // Timer(const Duration(seconds: 9), () => startAnimation());
                  },
                  child: Text("Abir vai, Ready?")),
            ),
          ],
        ),
      ),
    );
  }
}
