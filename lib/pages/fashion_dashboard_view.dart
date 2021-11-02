import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class FashionImageShow extends StatefulWidget {
  @override
  State<FashionImageShow> createState() => _FashionImageShowState();
}

class _FashionImageShowState extends State<FashionImageShow> {
  final String dummyText =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";

  IconData favIcon = Icons.favorite_border;
  IconData followIcon = Icons.add_circle;
  Color iconColor = Colors.white;
  int count = 2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/kayak.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert, color: Colors.white)),
                  ],
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.comment_outlined,
                                  color: Colors.white,
                                )),
                            Text(
                              "1",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (iconColor == Colors.white) {
                                      favIcon = Icons.favorite;
                                      iconColor = Colors.red;
                                      count = count + 1;
                                    } else if (iconColor == Colors.red) {
                                      favIcon = Icons.favorite_border;
                                      iconColor = Colors.white;
                                      count = count - 1;
                                    }
                                  });
                                },
                                icon: Icon(
                                  favIcon,
                                  color: iconColor,
                                )),
                            Text(
                              "${count}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.white,
                                )),
                            Text(
                              "3",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.all(15),
                child: Blur(
                  overlay: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Milla Jovovich",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  dummyText,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ]),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Material(
                              color: Colors.red[700],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(30),
                              ),
                              child: InkWell(
                                splashColor: Colors.amber,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(30),
                                ),
                                focusColor: Colors.blue,
                                onTap: () {
                                  setState(() {
                                    if (followIcon == Icons.add_circle) {
                                      followIcon = Icons.check_circle;
                                    } else {
                                      followIcon = Icons.add_circle;
                                    }
                                  });
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: Colors.red[700],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(30),
                                      )),
                                  height: 40,
                                  width: 105,
                                  //color: Colors.red,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Follow",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Icon(
                                          followIcon,
                                          color: Colors.white,
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                  borderRadius: BorderRadius.circular(19),
                  blurColor: Colors.transparent,
                  blur: 5.0,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(10),
                    height: 130,
                    width: size.width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
