import 'package:flutter/foundation.dart';
import 'package:world_news_app/News_app/Model/News_model.dart';
import 'package:world_news_app/utils/Api_helper.dart';

class NewsProvider extends ChangeNotifier
{
  Future<NewsModel> newsDataParsing() async {
    return await ApiData.apiData.getApiData();
  }
}