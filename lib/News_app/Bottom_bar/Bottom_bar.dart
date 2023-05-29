import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news_app/News_app/Bottom_bar/Bottom_provider.dart';

class Bottom_navigation extends StatefulWidget {
  const Bottom_navigation({Key? key}) : super(key: key);

  @override
  State<Bottom_navigation> createState() => _Bottom_navigationState();
}

class _Bottom_navigationState extends State<Bottom_navigation> {

  BottomProvider? providerF;
  BottomProvider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<BottomProvider>(context,listen: false);
    providerT=Provider.of<BottomProvider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.format_align_center,size: 35,color: Colors.black,),
          centerTitle: true,
          title: Text("DD News",style: TextStyle(fontSize: 25,color: Color(0xffCC3939)),),
          actions: [
            Icon(Icons.notifications,size: 35,color: Colors.black,),
            SizedBox(width: 10),
          ],
          elevation: 0,
        ),
        body: providerT!.screenList[providerT!.i],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xffCC3939),
          currentIndex: providerT!.i,
          onTap: (value) {
            providerF!.selectScreen(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined,size: 35,color: Colors.white,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.video_camera_back,size: 35,color: Colors.white,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined,size: 35,color: Colors.white,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.star_border_outlined,size: 35,color: Colors.white,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded,size: 35,color: Colors.white,),label: ""),
          ],
        ),
      ),
    );
  }
}
