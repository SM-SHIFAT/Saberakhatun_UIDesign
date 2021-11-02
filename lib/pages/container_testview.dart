import 'package:flutter/material.dart';

import 'container_test.dart';

class ContainerTestView extends StatefulWidget {
  @override
  State<ContainerTestView> createState() => _ContainerTestViewState();
}

class _ContainerTestViewState extends State<ContainerTestView> {
  String text = "hello";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Banner Listtile"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          width: width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                BannerListTile(
                  bannersize: 30,
                  bannerText: "Hello bro",
                  trailingBoxwidth: null,
                  bannerPositionRight: true,
                  backgroundColor: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                  // imageContainer: Image(
                  //     image: AssetImage("assets/image/model.jpg"),
                  //     fit: BoxFit.cover),
                  title: Text(
                    text,
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  subtitle: Text(
                    "Monalisa  MonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisa",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  // trailing: IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         text =
                  //             "MMoMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisanalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisa";
                  //       });
                  //     },
                  //     icon: Icon(
                  //       Icons.cancel,
                  //       color: Colors.red,
                  //     )),
                ),
                SizedBox(height: 4),
                BannerListTile(
                  bannersize: 100,
                  imageContainerSize: 80,
                  imageContainerShapeZigzagIndex: 0,
                  backgroundColor: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                  imageContainer: Image(
                      image: AssetImage("assets/image/model.jpg"),
                      fit: BoxFit.cover),
                  title: Text(
                    "Monalisa ",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  subtitle: Text(
                    "Monalisa  ",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      )),
                ),
                SizedBox(height: 4),
                // //
                BannerListTile(
                  imageContainerShapeZigzagIndex: 1,
                  bannerPositionRight: true,
                  borderRadius: BorderRadius.circular(8),
                  imageContainer: Image(
                      image: AssetImage("assets/image/model.jpg"),
                      fit: BoxFit.cover),
                  title: Text(
                    "Lisa",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text("A model from NY",
                      style: TextStyle(fontSize: 13, color: Colors.white)),
                  trailing: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                )),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                //

                //

                //
                SizedBox(height: 4),
                //
                BannerListTile(
                  randomBackgroundColor: true,
                  showBanner: false,
                  bannerText: "banner",
                  bannerPositionRight: false,
                  borderRadius: BorderRadius.circular(8),
                  imageContainer: Image(
                      image: AssetImage("assets/image/model.jpg"),
                      fit: BoxFit.cover),
                  title: Text(
                    "LisaaaaaaaaaaaaaaaaaaaaaaaaaaaaafffffffffffffffffffghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaaaaaaaaaaaaaaLisaaaaaaaaaaaaaaaaaaaaaaaaaaaaafffffffffffffffffffghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaLisaaaaaaaaaaaaaaaaaaaaaaaaaaaaafffffffffffffffffffghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  ),
                  subtitle: Text(
                    "A model from NYdgggggggggsgdddddddddddddddddddddddfsdddddddddddddddddddddddddddddddddddddddddddfggggggggggNYdgggggggggsgdddddddddddddddddddddddfsdddddddddddddddddddddddddddddddddddddddddddfgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggfggNYdgggggggggsgdddddddddddddddddddddddfsdddddddddddddddddddddddddddddddddddddddddddfggggggggggNYdgggggggggsgdddddddddddddddddddddddfsdddddddddddddddddddddddddddddddddddddddddddfgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggfgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggfgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggf",
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      )),
                ),
                SizedBox(height: 4),
                ListTile(
                  tileColor: Colors.blue,
                  // leading: Image(
                  //     image: AssetImage("assets/image/model.jpg"),
                  //     fit: BoxFit.cover),
                  title: Text(
                    "Modelllll",
                  ),
                  subtitle: Text("Modelllll"),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
                ),
                SizedBox(height: 4),
                ListTile(
                  tileColor: Colors.blue,
                  leading: Image(
                      image: AssetImage("assets/image/model.jpg"),
                      fit: BoxFit.cover),
                  title: Text(
                    "Modelllll MMoMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisanalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisa",
                  ),
                  subtitle: Text(
                      "Modelllll MMoMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisanalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisaMonalisa"),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
                ),
                // SizedBox(height: 4),
                // Material(
                //   borderRadius: BorderRadius.circular(20),
                //   elevation: 10,
                //   child: Container(
                //     width: width,
                //     height: 50,
                //     color: Colors.amber,
                //   ),
                // ),
                // SizedBox(height: 40),
              ],
            ),
          ),
        ));
  }
}
