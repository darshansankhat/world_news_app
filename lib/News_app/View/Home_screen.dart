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
            SizedBox(
              height: 5.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        providerF!.chanCountry(index);
                      },
                      child: Text("${providerT!.countryList[index]}"),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  );
                },
                itemCount: providerT!.countryList.length,
              ),
            ),
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
                          width: 100.w,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment(1, 1),
                                children: [
                                  Image.network(
                                      "${newsModel.articles![index].urlToImage}"),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                  ),
                                ],
                              ),
                              Text(
                                "${newsModel.articles![index].title}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
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
