import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> {
  bool clicked = false;
  bool visibility = true;
  double animatedContainerWidth = 0;
  double animatedContainerheight = 5;
  String text = "   ";

  setHeight(width) {
    setState(() {
      animatedContainerheight = width / 3;
    });
  }

  setWidth(width) {
    setState(() {
      animatedContainerWidth = width / 2;
    });
  }

  setText() {
    setState(() {
      text = "🎉 Done! 🎉";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.amber,
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              AnimatedPositioned(
                curve: Curves.bounceOut,
                duration: Duration(seconds: 4),
                left: clicked ? 0 : size.width,
                child: ClipPath(
                  clipper: ImageClipper(1),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/pointleft.png"))),
                    height: size.height,
                    width: size.width,
                  ),
                ),
              ),
              AnimatedPositioned(
                curve: Curves.bounceOut,
                duration: Duration(seconds: 4),
                right: clicked ? 0 : size.width,
                child: ClipPath(
                  clipper: ImageClipper(0),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/pointright.png"))),
                    height: size.height,
                    width: size.width,
                  ),
                ),
              ),
              Visibility(
                replacement: SizedBox.shrink(),
                visible: visibility,
                child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            visibility = false;
                            clicked = !clicked;
                          });
                          Timer(const Duration(seconds: 7),
                              () => setWidth(size.width));
                          Timer(const Duration(seconds: 8),
                              () => setHeight(size.width));
                          Timer(const Duration(seconds: 9), () => setText());
                        },
                        child: Text("start"))),
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AnimatedContainer(
                    padding: EdgeInsets.all(17),
                    alignment: Alignment.center,
                    color: Colors.green,
                    duration: Duration(seconds: 1),
                    width: animatedContainerWidth,
                    height: animatedContainerheight,
                    child: FittedBox(
                      child: Text(
                        text,
                        maxLines: 1,
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  final int side;
  ImageClipper(this.side);
  @override
  Path getClip(Size size) {
    var path = Path();

    double halfwidth = size.width / 2.0;
    double curveheight = size.height / 10;

    path.moveTo(halfwidth, 0);
    path.lineTo(halfwidth - ((10 * halfwidth) / 100), curveheight);
    path.lineTo(halfwidth, curveheight * 2);
    path.lineTo(halfwidth - ((10 * halfwidth) / 100), curveheight * 3);
    path.lineTo(halfwidth, curveheight * 4);
    path.lineTo(halfwidth - ((10 * halfwidth) / 100), curveheight * 5);
    path.lineTo(halfwidth, curveheight * 6);
    path.lineTo(halfwidth - ((10 * halfwidth) / 100), curveheight * 7);
    path.lineTo(halfwidth, curveheight * 8);
    path.lineTo(halfwidth - ((10 * halfwidth) / 100), curveheight * 9);
    path.lineTo(halfwidth, size.height);
    if (side == 0) {
      path.lineTo(0, size.height);
      path.lineTo(0, 0);
    } else {
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
