import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  _CounterApp createState() => _CounterApp();
}

class _CounterApp extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lime,
        appBar: AppBar(
          title: Text(
            "Счетчик туда-сюда",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Text("Для увеличения нажми +"),
              Text("Для уменьшения нажми -"),
            ],
          ),
        ),
      ),
    );
  }
}
