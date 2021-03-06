import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        appBar: AppBar(
          title: const Text("Простой счетчки"),
          centerTitle: true,
          backgroundColor: const Color(0xff393E46),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "- ддя уменьшения",
                  style: TextStyle(fontSize: 18, color: Color(0xff222831)),
                ),
                const SizedBox(
                  height: 20,
                ),
                CounterApp(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "+ для увеличения",
                  style: TextStyle(fontSize: 18, color: Color(0xff222831)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CounterApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CounterApp({Key? key}) : super(key: key);

  @override
  _CounterApp createState() => _CounterApp();
}

class _CounterApp extends State<CounterApp> {
  late int _counter;

  @override
  void initState() {
    _counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  setState(() {
                    _counter--;
                  });
                },
                icon: const Image(
                  image: AssetImage("assets/images/minus.png"),
                )),
            Text(_counter.toString(),
                style: const TextStyle(
                    fontSize: 30,
                    color: Color(0xffFD7013),
                    fontWeight: FontWeight.w500)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                icon: const Image(
                  image: AssetImage("assets/images/plus.png"),
                )),
          ],
        ),
        Text(
          _counter >= 0 ? "" : "Минус это плохо, лучше плюс!",
          style: TextStyle(color: Color(0xffFD7013)),
        ),
      ],
    );
  }
}
