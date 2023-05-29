import 'package:flutter/material.dart';

class Person_screen extends StatefulWidget {
  const Person_screen({Key? key}) : super(key: key);

  @override
  State<Person_screen> createState() => _Person_screenState();
}

class _Person_screenState extends State<Person_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Person_screen"),
    );
  }
}
