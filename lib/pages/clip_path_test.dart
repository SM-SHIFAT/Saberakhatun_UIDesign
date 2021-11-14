import 'package:flutter/material.dart';

class ClipPathExample extends StatelessWidget {
  const ClipPathExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ClipPath"),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          width: size.width,
          height: size.height,
          child: ClipPath(
            clipper: BoxClipper(),
            child: Container(
              height: size.width - 20,
              width: size.width - 20,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}

class BoxClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();

    path.moveTo(width / 2, 0);
    path.lineTo(0, height / 3);
    path.lineTo((width / 2) - 8, 2 * (height / 3));
    path.lineTo(width / 3, height); //oval

    //path.lineTo(width / 2, height - 10);
    path.quadraticBezierTo(width / 2, height - 50, 2 * (width / 3), height);

    //path.lineTo(2 * (width / 3), height);
    path.lineTo((width / 2) + 8, 2 * (height / 3));
    path.lineTo(width, height / 3);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
