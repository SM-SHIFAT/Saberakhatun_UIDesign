import 'package:flutter/material.dart';
import 'package:myapp/apiservice/news_api_service.dart';
import 'package:myapp/model/top_headline_model.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late Future<TopHeadlineModel> futureTopheadlineModel;
  String text = "";
  String time = "";
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
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(text),
            Text(time),
          ],
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: FutureBuilder<TopHeadlineModel>(
              future: futureTopheadlineModel,
              builder: (buildContext, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(child: Text("offline"));
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  default:
                    if (!snapshot.hasError) {
                      // setState(() {
                      //   text = snapshot.data!.feed.subtitle;
                      //   time = snapshot.data!.feed.updated;
                      // });
                      return Column(
                        children: [
                          ListTile(
                              title: Text(snapshot.data!.articles[1].title),
                              subtitle: Text(snapshot.data!.articles[1].link),
                              isThreeLine: true,
                              trailing: Text(
                                snapshot.data!.articles[1].published,
                              ))
                        ],
                      );
                    } else {
                      return Text(snapshot.error.toString());
                    }
                }
              })),
    );
  }
}
