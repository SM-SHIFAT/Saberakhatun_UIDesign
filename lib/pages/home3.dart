import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widget/news_card_widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List bannerImage = [
    {
      "name": "Rahim",
      "age": "23",
      "nationality": "Bangladeshi",
    },
    {
      "name": "Ramesh",
      "age": "22",
      "nationality": "Indian",
    },
    {
      "name": "Alex",
      "age": "27",
      "nationality": "USA",
    },
    {
      "name": "Alex",
      "age": "27",
      "nationality": "USA",
    },
  ];

  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          child: Column(
            children: [
              Container(
                child: CarouselSlider(
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                      height: 220.0,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        print("Page Changed $index");
                        print("Current number = $_current");
                        setState(() {
                          _current = index;
                        });
                        print("Current number = $_current");
                      }),
                  items: bannerImage.map((banner) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: _width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            // decoration: BoxDecoration(color: Colors.amber),
                            child: Card(
                              elevation: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg",
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${banner["name"]}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.note_add,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${banner["nationality"]}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${banner["age"]}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bannerImage.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () =>
                        buttonCarouselController.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Recent News"),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: bannerImage.length,
                    itemBuilder: (buildContext, index) {
                      var bannerDetails = bannerImage[index];
                      return NewsCardWidget(
                        imageUrl:
                            "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg",
                        title: "${bannerDetails["name"]}",
                        subTitle: "${bannerDetails["nationality"]}.",
                        icon: Icons.book,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
