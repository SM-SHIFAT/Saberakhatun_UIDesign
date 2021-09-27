import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  final urlImages = [
    'https://images.unsplash.com/photo-1521336575822-6da63fb45455?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Logo",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0.3,
          bottom: PreferredSize(
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3,
                  //labelPadding: EdgeInsets.all(0),
                  isScrollable: true,
                  unselectedLabelColor: Colors.black.withOpacity(0.3),
                  indicatorColor: Colors.orange,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Text('All news'),
                    ),
                    Tab(
                      child: Text('Business'),
                    ),
                    Tab(
                      child: Text('Politics'),
                    ),
                    Tab(
                      child: Text('Tech'),
                    ),
                    Tab(
                      child: Text('Science'),
                    ),
                    Tab(
                      child: Text('Fashion'),
                    )
                  ]),
              preferredSize: Size.fromHeight(30.0)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.add_alert,
                color: Colors.orange,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            width: _size.width,
            height: _size.height,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 18),
                      Container(
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                              viewportFraction: 0.8,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              //height: 300,
                              aspectRatio: 21 / 9,
                              autoPlay: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              }),
                          itemCount: urlImages.length,
                          itemBuilder: (context, index, realIndex) {
                            final urlImage = urlImages[index];
                            return Card(
                              child: Container(
                                width: _size.width,
                                //margin: EdgeInsets.symmetric(horizontal: 12),
                                color: Colors.green,
                                child: Image.network(
                                  urlImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 8),
                      AnimatedSmoothIndicator(
                        effect: JumpingDotEffect(
                            activeDotColor: Colors.orange,
                            dotHeight: 6,
                            dotWidth: 6,
                            dotColor: Colors.orange,
                            paintStyle: PaintingStyle.stroke),
                        activeIndex: activeIndex,
                        count: urlImages.length,
                      )
                    ],
                  ),
                ), //..............................................end caurosel
                Container(
                  child: Center(
                    child: Text('Tab 2'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('Tab 3'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('Tab 4'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('Tab 5'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('Tab 6'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
