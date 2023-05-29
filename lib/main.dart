import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news_app/News_app/Bottom_bar/Bottom_bar.dart';
import 'package:world_news_app/News_app/Bottom_bar/Bottom_provider.dart';
import 'package:world_news_app/News_app/Provider/NewsProvider.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomProvider(),),
          ChangeNotifierProvider(create: (context) => NewsProvider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => Bottom_navigation(),
          },
        ),
      ),
    ),
  );
}
