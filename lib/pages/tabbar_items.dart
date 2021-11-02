import 'package:flutter/material.dart';

class TabbarItem extends StatelessWidget {
  const TabbarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: (size.width / 2.3) + 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.all(10),
                height: (size.width / 2.3) + 60,
                width: size.width / 2.3,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage("assets/image/kayak.jpg"),
                //         fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Card(
                      elevation: 8,
                      shadowColor: Colors.purple,
                      child: Container(
                        width: double.infinity,
                        height: (size.width / 2.3) + 30,
                        child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/kayak.jpg")),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text("Name"),
                    Text("Paris"),
                  ],
                ));
          }),
    );
  }
}
