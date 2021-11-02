import 'package:flutter/material.dart';
import 'package:myapp/services/form_validation.dart';
import 'package:myapp/widget/custom_textfield_widget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool visible = false;
  int? tileIndex;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController webController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List user = [
    {"name": "ahsfasdf", "mobile": "12352345", "web": "sdfgsdfg"},
    {"name": "ahsfasdf", "mobile": "12352345", "web": "sdfgsdfg"},
    {"name": "ahsfasdf", "mobile": "12352345", "web": "sdfgsdfg"},
    {"name": "ahsfasdf", "mobile": "12352345", "web": "sdfgsdfg"},
    {"name": "ahsfasdf", "mobile": "12352345", "web": "sdfgsdfg"},
    {"name": "ahsfasdf", "mobile": "12352345", "web": "sdfgsdfg"},
  ];

  addDataToList() {
    user.add({
      "name": "${nameController.text}",
      "mobile": "${phoneController.text}",
      "web": "${webController.text}"
    });
    nameController.clear();
    phoneController.clear();
    webController.clear();
  }

  editListData(index) {
    setState(() {
      user[index]["name"] = nameController.text;
      user[index]["mobile"] = phoneController.text;
      user[index]["web"] = webController.text;
      // user[index]({
      //   "name": "${nameController.text}",
      //   "mobile": "${phoneController.text}",
      //   "web": "${webController.text}"
      // });
    });
    nameController.clear();
    phoneController.clear();
    webController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Card(
                    shadowColor: Colors.blueGrey,
                    elevation: 7,
                    child: ColoredBox(
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTextField(
                              formKey: _formKey,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: nameController,
                              icon: Icons.person,
                              textInputType: TextInputType.name,
                              labelText: "Name"),
                          CustomTextField(
                              formKey: _formKey,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: phoneController,
                              icon: Icons.phone,
                              textInputType: TextInputType.phone,
                              labelText: "Mobile Number"),
                          CustomTextField(
                              formKey: _formKey,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: webController,
                              icon: Icons.web_rounded,
                              textInputType: TextInputType.url,
                              labelText: "Website"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (validateAndSave(_formKey)) {
                                    setState(() {
                                      addDataToList();
                                    });
                                  } else {
                                    print("Not submit");
                                  }

                                  print(user);
                                },
                                child: Text("Submit"),
                                style: ButtonStyle(
                                  alignment: Alignment.center,
                                ),
                              ),
                              Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                visible: visible,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (validateAndSave(_formKey)) {
                                      setState(() {
                                        editListData(tileIndex);
                                        visible = false;
                                      });
                                    } else {
                                      print("Not submit");
                                    }
                                  },
                                  child: Text("Update"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          user.isEmpty
                              ? Center(child: Text("Empty"))
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: user.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          tileIndex = index;
                                          print("Edited");
                                          setState(() {
                                            visible = true;
                                            nameController.text =
                                                user[index]["name"].toString();
                                            phoneController.text = user[index]
                                                    ["mobile"]
                                                .toString();
                                            webController.text =
                                                user[index]["web"].toString();
                                          });
                                        },
                                        child: ListTile(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.green,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          contentPadding: EdgeInsets.all(8),
                                          leading: CircleAvatar(
                                              radius: 25,
                                              child: Image(
                                                image: AssetImage(
                                                    "assets/image/dog.jpg"),
                                              )),
                                          trailing: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  user.removeAt(index);
                                                });
                                              },
                                              icon: Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              )),
                                          title: Text(
                                            user[index]["name"].toString(),
                                          ),
                                          subtitle: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                user[index]["mobile"]
                                                    .toString(),
                                              ),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.facebook_outlined,
                                                        color: Colors.black87,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        color: Colors.black87,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.phone,
                                                        color: Colors.black87,
                                                      )),
                                                ],
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
