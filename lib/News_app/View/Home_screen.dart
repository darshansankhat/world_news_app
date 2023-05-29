import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news_app/News_app/Model/News_model.dart';
import 'package:world_news_app/News_app/Provider/NewsProvider.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  NewsProvider? providerF;
  NewsProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<NewsProvider>(context, listen: true);
    providerF = Provider.of<NewsProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top News",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: providerF!.newsDataParsing(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    "Failed ${snapshot.error}",
                    style: TextStyle(fontSize: 25),
                  );
                } else if (snapshot.hasData) {
                  NewsModel newsModel = snapshot.data!;

                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            de
                          ),
                        );
                      },
                      itemCount: newsModel.articles!.length,
                    ),
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
