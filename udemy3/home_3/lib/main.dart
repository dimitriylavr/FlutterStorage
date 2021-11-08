import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[400],
        appBar: AppBar(
          title: const Text("Виджет погоды"),
          centerTitle: true,
          backgroundColor: Colors.red[400],
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
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Moscow oblast, RU",
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Friday, mar 20, 2021",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 50,
              ),
              _temperatureDetails(),
              const SizedBox(
                height: 50,
              ),
              _extraWeatherDetails(),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "7-Day weather forecast",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              _bottomDetails(),
              const SizedBox(
                height: 50,
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
        const Icon(
          Icons.wb_sunny,
          color: Colors.yellow,
          size: 100,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: const [
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
        children: const [
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
        children: const [
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
        children: const [
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

Container _bottomDetails() {
  return Container(
    height: 150,
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    child: ListView(
      scrollDirection: Axis.horizontal,
      itemExtent: 150,
      children: [
        _cardWidget("Friday", 6),
        _cardWidget("Saturday", 9),
        _cardWidget("Sunday", 15),
        _cardWidget("Monday", 7),
        _cardWidget("Tuesday", 10),
        _cardWidget("Wednesday", 13),
        _cardWidget("Thursday", 4),
      ],
    ),
  );
}

Card _cardWidget(String _names, int _fore) {
  return Card(
    color: Colors.transparent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _names,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _fore.toString(),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(
              width: 15,
            ),
            Icon(
              Icons.wb_sunny,
              color: Colors.white,
              size: 30,
            ),
          ],
        )
      ],
    ),
  );
}
