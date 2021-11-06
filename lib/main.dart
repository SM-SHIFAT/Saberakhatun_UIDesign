import 'package:flutter/material.dart';
import 'package:myapp/pages/fashion_dashboard.dart';
import 'package:myapp/pages/home3.dart';
import 'package:myapp/pages/new_home_screen.dart';
import 'package:myapp/pages/testScreen.dart';

import 'pages/News_dashboard.dart';
import 'pages/container_test.dart';
import 'pages/container_testview.dart';
import 'pages/fashion_dashboard_view.dart';
import 'pages/home_screen.dart';
import 'pages/login.dart';
import 'pages/news_view.dart';
import 'pages/splash_screen.dart';

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
      home: //BannerListTileExample()
          //ContainerTestView(),
          //FashionDashboard(),
          // FashionImageShow(),
          //TestScreen(), //LoginScreen(), //SplashScreen(),
          // NewsView(),
          NewsDashboard(),
    );
  }
}
