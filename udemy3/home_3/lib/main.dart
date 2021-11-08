import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[400],
        appBar: AppBar(
          title: Text("Виджет погоды"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
              const Divider(),
              const Text(
                "Moscow oblast, RU",
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
              const Divider(),
              const Text(
                "Friday, mar 20, 2021",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                    size: 50,
                  ),
                  Column(
                    children: [
                      Text(
                        "14° C",
                        style: TextStyle(color: Colors.white, fontSize: 33),
                      ),
                      Divider(),
                      Text("Light snow"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
