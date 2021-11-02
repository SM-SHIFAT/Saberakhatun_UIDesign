import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitPopService extends StatelessWidget {
  final page;
  const ExitPopService(this.page);

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
          context: context,
          builder: (buildcontext) {
            return AlertDialog(
              title: Text(
                "Warning",
                style: TextStyle(color: Colors.red),
              ),
              content: Text("Want to Exit!"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("no")),
                ElevatedButton(
                    onPressed: () {
                      if (Platform.isIOS) {
                        exit(0);
                      } else {
                        SystemNavigator.pop();
                      }
                    },
                    child: Text("Yes")),
              ],
            );
          });
    }

    return WillPopScope(child: page, onWillPop: showExitPopup);
  }
}
