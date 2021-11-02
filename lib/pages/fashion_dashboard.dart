import 'package:flutter/material.dart';

import 'tabbar_items.dart';

class FashionDashboard extends StatelessWidget {
  final List itemlist = [
    "Recommended   ",
    "New Model   ",
    "2020 Show   ",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(15),
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          alignment: Alignment.centerLeft,
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black,
                          )),
                      IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () {},
                          icon: Icon(Icons.search, color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Fashion Week",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 2),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "2021 Fashion Show in Paris",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Explore",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu_open))
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                      width: size.width,
                      height: 30,
                      child: TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(
                              text: "Recommended",
                            ),
                            Tab(
                              text: "New Model",
                            ),
                            Tab(
                              text: "2020 Show",
                            ),
                          ])),
                  Container(
                    width: size.width,
                    height: (size.width / 2.3) + 120,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        TabbarItem(),
                        TabbarItem(),
                        TabbarItem(),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.purple,
                    child: Container(
                      width: size.width,
                      height: size.width / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/kayak.jpg")),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
