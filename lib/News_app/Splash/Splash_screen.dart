import 'package:flutter/material.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, "/");
      },
    );

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/l.png",
                height: 150,
                width: 150,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LinearProgressIndicator(
                  color: Colors.red,
                  backgroundColor: Colors.red.shade100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
