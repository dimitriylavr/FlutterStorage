import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  return ListView(
    padding: EdgeInsets.all(10),
    //scrollDirection: Axis.horizontal,
    //itemExtent: 200,
    //reverse: true,
    children: const [
      ListTile(
        title: Text("Sun"),
        subtitle: Text("data"),
        leading: Icon(Icons.ac_unit, color: Colors.yellow),
      ),
      ListTile(
        title: Text("Cloudy"),
        subtitle: Text("data"),
        leading: Icon(Icons.ac_unit, color: Colors.yellow),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
        ),
      ),
      ListTile(
        title: Text("Snow"),
        subtitle: Text("data"),
        leading: Icon(Icons.ac_unit, color: Colors.yellow),
      ),
    ],
  );
}
