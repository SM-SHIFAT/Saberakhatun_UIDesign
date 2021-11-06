import 'package:flutter/material.dart';

import 'news_view.dart';

class NewsDashboard extends StatefulWidget {
  @override
  State<NewsDashboard> createState() => _NewsDashboardState();
}

class _NewsDashboardState extends State<NewsDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<bool> selected = [
    true,
    false,
    false,
    false,
    false
  ]; // first item choosed as default

  void _isSelected(int index) {
    List<bool> item = [false, false, false, false, false];
    for (int i = 0; i < 5; i++) {
      if (index == i) {
        item[i] = true;
      } else {
        item[i] = false;
      }
    }
    setState(() {
      selected = item;
    });
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
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
                selected: selected[0],
                selectedTileColor: Colors.blueGrey,
                onTap: () {
                  _isSelected(0);
                  _closeDrawer(context);
                },
                leading: Icon(Icons.web_outlined),
                title: Text("Top Headlines"),
                trailing: Icon(Icons.arrow_right_rounded),
              ),
              ListTile(
                selected: selected[1],
                selectedTileColor: Colors.blueGrey,
                onTap: () {
                  _isSelected(1);
                  _closeDrawer(context);
                },
                leading: Icon(Icons.web_stories),
                title: Text("Headlines Topic"),
                trailing: Icon(Icons.arrow_right_rounded),
              ),
              ListTile(
                selected: selected[2],
                onTap: () {
                  _isSelected(2);
                  _closeDrawer(context);
                },
                selectedTileColor: Colors.blueGrey,
                leading: Icon(Icons.place_rounded),
                title: Text("Geographic Headlines"),
                trailing: Icon(Icons.arrow_right_rounded),
              ),
              ListTile(
                selected: selected[3],
                selectedTileColor: Colors.blueGrey,
                onTap: () {
                  _isSelected(3);
                  _closeDrawer(context);
                },
                leading: Icon(Icons.search_rounded),
                title: Text("Search"),
                trailing: Icon(Icons.arrow_right_rounded),
              ),
              ListTile(
                selected: selected[4],
                selectedTileColor: Colors.blueGrey,
                onTap: () {
                  _isSelected(4);
                  _closeDrawer(context);
                },
                leading: Icon(Icons.source),
                title: Text("Search by Source"),
                trailing: Icon(Icons.arrow_right_rounded),
              ),
            ],
          ),
        )),
        appBar: selected[3]
            ? AppBar(
                leading:
                    IconButton(onPressed: _openDrawer, icon: Icon(Icons.menu)),
                title: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 4),
                    color: Colors.white,
                    width: double.infinity,
                    child: TextFormField(
                      initialValue: "Search...",
                    ),
                  ),
                ),
              )
            : AppBar(
                leading:
                    IconButton(onPressed: _openDrawer, icon: Icon(Icons.menu)),
                title: Text("News Today")),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: returnWidget(),
        ),
      ),
    );
  }

  Widget returnWidget() {
    if (selected[0]) {
      return NewsView();
    } else if (selected[1]) {
      return Center(
        child: Text("1"),
      );
    } else if (selected[2]) {
      return Center(
        child: Text("2"),
      );
    } else if (selected[3]) {
      return Center(
        child: Text("3"),
      );
    } else if (selected[4]) {
      return Center(
        child: Text("4"),
      );
    } else {
      // it will show first item by default
      return Center(
        child: Text("0"),
      );
    }
  }
}
