import 'package:flutter/material.dart';
import 'package:myapp/apiservice/news_api_service.dart';
import 'package:myapp/model/headline_topic.dart';
import 'package:myapp/model/top_headline_model.dart';
import 'package:myapp/pages/news_appbar.dart';
import 'package:myapp/services/page_navigate_service.dart';
import 'package:myapp/services/webview.dart';

class HeadlineTopic extends StatefulWidget {
  const HeadlineTopic({Key? key}) : super(key: key);

  @override
  State<HeadlineTopic> createState() => _HeadlineTopicState();
}

class _HeadlineTopicState extends State<HeadlineTopic> {
  bool tapped = false;
  int? indexx;
  late Future<HeadlineTopicModel> futureHeadlineTopicModel;
  @override
  void initState() {
    futureHeadlineTopicModel = NewsApiService().getHeadlineTopic();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<HeadlineTopicModel>(
            future: futureHeadlineTopicModel,
            builder: (buildContext, snapshot) {
              if (!snapshot.hasError) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(child: Text("offline"));
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  default:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NewsAppbar(),
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.blue,
                          width: size.width,
                          child: Column(
                            children: [
                              Text(
                                snapshot.data!.feed.subtitle,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              Text(
                                snapshot.data!.feed.updated,
                                style: TextStyle(color: Colors.white60),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.articles.length,
                              shrinkWrap: true,
                              itemBuilder: (buildContext, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 2, right: 8),
                                  child: GestureDetector(
                                    onLongPress: () {
                                      navigateToNextScreen(
                                          context,
                                          WebViewExample(
                                            initialUrl: snapshot
                                                .data!.articles[index].link,
                                          ));
                                    },
                                    onTap: () {
                                      setState(() {
                                        if (indexx == index) {
                                          indexx = null;
                                        } else {
                                          indexx = index;
                                        }
                                      });
                                    },
                                    child: Card(
                                      shadowColor: Colors.blue,
                                      elevation: 5,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            tileColor: index == indexx
                                                ? Colors.amber[400]
                                                : Colors.greenAccent[400],
                                            title: Text(
                                              snapshot
                                                  .data!.articles[index].title,
                                              maxLines:
                                                  index == index ? null : 1,
                                              overflow: index == indexx
                                                  ? null
                                                  : TextOverflow.ellipsis,
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.articles[index]
                                                  .published,
                                            ),
                                            trailing: index == indexx
                                                ? Icon(
                                                    Icons.arrow_drop_up_sharp)
                                                : Icon(Icons
                                                    .arrow_drop_down_sharp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    );
                }
              } else {
                return Text(snapshot.error.toString());
              }
            }));
  }
}
