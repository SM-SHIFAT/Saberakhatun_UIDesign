import 'package:flutter/material.dart';
import 'package:myapp/pages/news_appbar.dart';
import 'package:myapp/pages/news_drawer.dart';

import 'top_news_view.dart';

class NewsDashboard extends StatelessWidget {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: NewsDrawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: TopNewsView(),
        ),
      ),
    );
  }
}
