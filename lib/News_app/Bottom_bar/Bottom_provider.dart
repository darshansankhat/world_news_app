import 'package:flutter/cupertino.dart';
import 'package:world_news_app/News_app/View/Home_screen.dart';
import 'package:world_news_app/News_app/View/Location_screen.dart';
import 'package:world_news_app/News_app/View/Person_screen.dart';
import 'package:world_news_app/News_app/View/Star_screen.dart';
import 'package:world_news_app/News_app/View/Video_screen.dart';

class BottomProvider extends ChangeNotifier
{
  int i=0;

  List screenList=[
    Home_screen(),
    Video_screen(),
    Location_screen(),
    Star_screen(),
    Person_screen(),
  ];

  void selectScreen(int value)
  {
    i=value;

    notifyListeners();
  }
}