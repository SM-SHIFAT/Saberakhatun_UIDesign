import 'package:flutter/material.dart';

import 'News_dashboard.dart';

class NewsAppbar extends StatelessWidget {
  final String? text;
  const NewsAppbar({Key? key, this.text}) : super(key: key);
  void _openDrawer() {
    NewsDashboard.scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: _openDrawer, icon: Icon(Icons.menu)),
      title: text == null ? Text("News Today") : Text("$text"),
    );
  }
}
