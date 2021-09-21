import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProfileScreen extends StatefulWidget {
  final String image;
  final Size size;

  ProfileScreen(this.size, this.image);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List fruitsList = [];
  TextEditingController _fruitAddControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.green[400],
          title: Text("something"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
        body: Container(
          width: widget.size.width,
          height: widget.size.height,
          //color: Colors.white,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Hero(
                    tag: "profile",
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.orange,
                      backgroundImage: AssetImage(widget.image),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      print(fruitsList);
                    },
                    child: Text("Show List")),
                SizedBox(height: 20),
                TextFormField(
                  controller: _fruitAddControl,
                  decoration: InputDecoration(
                      labelText: "fruits name", hintText: "e.g. fruit name"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        fruitsList.add(_fruitAddControl.text);
                        print(fruitsList);
                        _fruitAddControl.clear();
                      });
                      FocusScope.of(context)
                          .unfocus(); //........................................unfocus
                    },
                    child: Text("Add")),
                //SizedBox(height: 20),
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: fruitsList.length,
                    itemBuilder: (buildcontext, index) {
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.20,
                        child: Card(
                            color: Colors.amber,
                            borderOnForeground: true,
                            elevation: 6,
                            child: Center(
                                child: Container(
                                    //height: 20,
                                    child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 10),
                                FittedBox(
                                  child: Text(
                                    fruitsList[index],
                                    style: TextStyle(fontSize: 29),
                                  ),
                                ),
                                OutlinedButton(
                                  style: ButtonStyle(),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      fruitsList.removeAt(
                                          index); //..........................removeGrid
                                    });
                                  },
                                ),
                              ],
                            )))),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {
                              setState(() {
                                fruitsList.removeAt(
                                    index); //..........................removeGrid
                              });
                            },
                          ),
                        ],
                      );
                      //
                      // Card(
                      //     color: Colors.amber,
                      //     borderOnForeground: true,
                      //     elevation: 6,
                      //     child: Center(
                      //         child: Container(
                      //             //height: 20,
                      //             child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         SizedBox(height: 10),
                      //         FittedBox(
                      //           child: Text(
                      //             fruitsList[index],
                      //             style: TextStyle(fontSize: 29),
                      //           ),
                      //         ),
                      //         OutlinedButton(
                      //           style: ButtonStyle(),
                      //           child: Icon(
                      //             Icons.delete,
                      //             color: Colors.red,
                      //           ),
                      //           onPressed: () {
                      //             setState(() {
                      //               fruitsList.removeAt(
                      //                   index); //..........................removeGrid
                      //             });
                      //           },
                      //         ),
                      //       ],
                      //     ))));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// home work <-------------------------------------------------------------
// list ~
// listview ~
// listviewbuilder ~
// gridview ~
// gridviewbuilder ~
// listtile ~
// swaping varible of 2 variable. ~
//
//textformfield focus remove
//remove an item from gridview list
