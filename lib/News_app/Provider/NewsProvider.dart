import 'package:flutter/foundation.dart';
import 'package:world_news_app/News_app/Model/News_model.dart';
import 'package:world_news_app/utils/Api_helper.dart';

class NewsProvider extends ChangeNotifier
{

  String contry="in";

  List countryList=[
    "India",
    "USA",
    "China",
    "Koriya",
    "Norway",
    "Oman",
    "Pakistan",
  ];

  List conList=[
    "in",
    "us",
    "ch",
    "kr",
    "no",
    "om",
    "pk",
  ];

  Future<NewsModel> newsDataParsing() async {
    return await ApiData.apiData.getApiData(contry);
  }

  void chanCountry(int i)
  {
    contry=conList[i];

    notifyListeners();
  }
}