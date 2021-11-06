import 'package:flutter/material.dart';
import 'package:myapp/apiservice/news_api_service.dart';
import 'package:myapp/model/top_headline_model.dart';
import 'package:myapp/services/page_navigate_service.dart';
import 'package:myapp/services/webview.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  bool tapped = false;
  int? indexx;
  late Future<TopHeadlineModel> futureTopheadlineModel;
  @override
  void initState() {
    futureTopheadlineModel = NewsApiService().getTopHeadlines();
    showtext();
    super.initState();
  }

  void showtext() async {
    //var data = await NewsApiService.getTopHeadlines();

    setState(() {
      //text = data.feed.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<TopHeadlineModel>(
                future: futureTopheadlineModel,
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
                                          // if (tapped == true) {
                                          //   setState(() {
                                          //     tapped = false;
                                          //     indexx = null;
                                          //   });
                                          // } else {
                                          //   setState(() {
                                          //     tapped = true;
                                          //     indexx = index;
                                          //   });
                                          // }
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
                                                  snapshot.data!.articles[index]
                                                      .title,
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
                                                    ? Icon(Icons
                                                        .arrow_drop_up_sharp)
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
                })),
      ),
    );
  }
}
