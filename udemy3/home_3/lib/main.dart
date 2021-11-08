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
              SizedBox(
                height: 30,
              ),
              const Text(
                "Moscow oblast, RU",
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
              SizedBox(
                height: 30,
              ),
              const Text(
                "Friday, mar 20, 2021",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 30,
              ),
              _temperatureDetails(),
              SizedBox(
                height: 30,
              ),
              _extraWeatherDetails(),
              SizedBox(
                height: 30,
              ),
              Text(
                "7-Day weather forecast",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _temperatureDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wb_sunny,
          color: Colors.white,
          size: 100,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              "14° C",
              style: TextStyle(color: Colors.white, fontSize: 44),
            ),
            Text(
              "Light snow",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ],
        ),
      ],
    );
  }
}

Row _extraWeatherDetails() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(
            Icons.ac_unit,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "5",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "km/h",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.ac_unit,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "3",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "%",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.ac_unit,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "20",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "km/h",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    ],
  );
}
