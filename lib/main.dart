import 'package:flutter/material.dart';

import 'pages/container_testview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      //  ThemeData(
      //   primarySwatch: Colors.purple,
      // ),
      home: //BannerListTileExample(),
          ContainerTestView(),
      //FashionDashboard(),
      // FashionImageShow(),
      //TestScreen(), //LoginScreen(), //SplashScreen(),
      // NewsView(),
      //NewsDashboard(),
      //AnimationTest(),
      //SlideAnimation(),
      //ClipPathExample(),
    );
  }
}
