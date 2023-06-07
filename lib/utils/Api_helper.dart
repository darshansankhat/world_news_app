import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:world_news_app/News_app/Model/News_model.dart';

class ApiData {

  static ApiData apiData=ApiData();

  Future<NewsModel> getApiData(String country) async {
    String link = "https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=5144cf846a9042e19d8ab4a602d1bf10";

    var response = await http.get(Uri.parse(link));

    var json = jsonDecode(response.body);

    NewsModel m1= NewsModel.fromJson(json);
    print(m1.status);
    return m1;
  }
}
