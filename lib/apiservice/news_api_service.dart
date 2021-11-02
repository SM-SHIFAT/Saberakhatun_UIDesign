import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/model/top_headline_model.dart';
import 'package:myapp/variables/variables.dart';

class NewsApiService {
  Future<TopHeadlineModel> getTopHeadlines() async {
    var url = topHeadlineUri;
    var headers = {'x-rapidapi-host': '$host', 'x-rapidapi-key': '$apiKey'};
    var response = await http.get(url, headers: headers);
    print(json.decode(response.body).toString());

    if (response.statusCode == 200) {
      return TopHeadlineModel.fromJson(json.decode(response.body));
    } else
      throw Exception("Failed to load news. Exception value");
  }
}
