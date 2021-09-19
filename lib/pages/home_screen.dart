import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile_screen.dart';

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);
  final String image = "assets/image/dog.jpg";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.deepPurple,
          width: size.width,
          height: size.height,
          //margin: EdgeInsets.only(left: 40),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // appbar section -----------------------------------------<
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu, color: Colors.white, size: 32),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileScreen(size, image)));
                          },
                          child: Hero(
                            tag: "profile",
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.orange,
                              backgroundImage: AssetImage(image),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    child: Text(
                      "Hi Badhon da!",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Align(
                    child: Text(
                      "6 task are pending",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.deepPurple[100],
                          fontWeight: FontWeight.normal),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 20),
                  // <-----------------------------------card start
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    shadowColor: Colors.deepPurple[900],
                    color: Colors.deepPurple[300],
                    elevation: 5.0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Mobile App Design",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Design your apps",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.deepPurple[100],
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.orange,
                                      backgroundImage:
                                          AssetImage("assets/image/dog.jpg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.pink,
                                      backgroundImage:
                                          AssetImage("assets/image/dog.jpg"),
                                    )
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ), // <-------------------------- card end
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Monthly Reviews",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 20,
                          child: Icon(
                            Icons.reviews,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  SizedBox(height: 10),

                  GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: [
                        Card(
                          elevation: 5,
                          color: Colors.deepPurple[300],
                          child: Container(
                              width: size.width / 3,
                              height: 500,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "22",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Done",
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ))
                              //child: ,
                              ),
                        ),
                        Card(
                          elevation: 5,
                          color: Colors.deepPurple[300],
                          child: Container(
                              width: size.width / 3,
                              height: 500,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "7",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "in progress",
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ))
                              //child: ,
                              ),
                        ),
                        Card(
                          elevation: 5,
                          color: Colors.deepPurple[300],
                          child: Container(
                              width: size.width / 3,
                              height: 500,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "10",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "ongoing",
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ))
                              //child: ,
                              ),
                        ),
                        Card(
                          elevation: 5,
                          color: Colors.deepPurple[300],
                          child: Container(
                              width: size.width / 3,
                              height: 500,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "12",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Waiting for review",
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ))
                              //child: ,
                              ),
                        ),
                      ]),

                  // GridView(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2),
                  //   children: [
                  //     Card(
                  //       elevation: 5,
                  //       color: Colors.deepPurple[300],
                  //       child: Container(
                  //         width: _size.width / 3,
                  //         height: 500,
                  //         //child: ,
                  //       ),
                  //     ),
                  //     Card(
                  //       elevation: 5,
                  //       color: Colors.deepPurple[300],
                  //       child: Container(
                  //         width: _size.width / 3,
                  //         height: 500,
                  //         //child: ,
                  //       ),
                  //     ),
                  //     Card(
                  //       elevation: 5,
                  //       color: Colors.deepPurple[300],
                  //       child: Container(
                  //         width: _size.width / 3,
                  //         height: 500,
                  //         //child: ,
                  //       ),
                  //     ),
                  //     Card(
                  //       elevation: 5,
                  //       color: Colors.deepPurple[300],
                  //       child: Container(
                  //         width: _size.width / 3,
                  //         height: 500,
                  //         //child: ,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 25,
            onTap: (tapped) {},
            backgroundColor: Colors.deepPurple,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.restore_page_rounded),
                label: "page",
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                label: "person",
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.notifications),
                label: "notification",
              ),
            ]),
      ),
    );
  }
}
