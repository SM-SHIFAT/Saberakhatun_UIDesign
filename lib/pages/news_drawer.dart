import 'package:flutter/material.dart';
import 'package:myapp/pages/top_news_view.dart';
import 'package:myapp/services/page_navigate_service.dart';

import 'News_dashboard.dart';

class NewsDrawer extends StatelessWidget {
  const NewsDrawer({Key? key}) : super(key: key);

  void _closeDrawer(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: Colors.blue,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                'Category',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              )),
          ListTile(
            selectedTileColor: Colors.blueGrey,
            onTap: () {
              navigateToNextScreen(context, TopNewsView());

              _closeDrawer(context);
            },
            leading: Icon(Icons.web_outlined),
            title: Text("Top Headlines"),
            trailing: Icon(Icons.arrow_right_rounded),
          ),
          ListTile(
            selectedTileColor: Colors.blueGrey,
            onTap: () {
              _closeDrawer(context);
            },
            leading: Icon(Icons.web_stories),
            title: Text("Headlines Topic"),
            trailing: Icon(Icons.arrow_right_rounded),
          ),
          ListTile(
            onTap: () {
              _closeDrawer(context);
            },
            selectedTileColor: Colors.blueGrey,
            leading: Icon(Icons.place_rounded),
            title: Text("Geographic Headlines"),
            trailing: Icon(Icons.arrow_right_rounded),
          ),
          ListTile(
            selectedTileColor: Colors.blueGrey,
            onTap: () {
              ;
              _closeDrawer(context);
            },
            leading: Icon(Icons.search_rounded),
            title: Text("Search"),
            trailing: Icon(Icons.arrow_right_rounded),
          ),
          ListTile(
            selectedTileColor: Colors.blueGrey,
            onTap: () {
              ;
              _closeDrawer(context);
            },
            leading: Icon(Icons.source),
            title: Text("Search by Source"),
            trailing: Icon(Icons.arrow_right_rounded),
          ),
        ],
      ),
    ));
  }
}
