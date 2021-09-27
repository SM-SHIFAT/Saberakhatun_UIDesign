import 'package:flutter/material.dart';
import 'package:myapp/pages/home3.dart';
import 'package:myapp/pages/new_home_screen.dart';

//import 'pages/home_screen.dart';
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
      home: DashBoardScreen(), //SplashScreen(),
    );
  }
}
