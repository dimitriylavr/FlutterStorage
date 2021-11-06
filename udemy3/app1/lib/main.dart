import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Layout widget"),
          centerTitle: true,
        ),
        body: const Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            "Привет, я такой вот текст",
            style: TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }
}
