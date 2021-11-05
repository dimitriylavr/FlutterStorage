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
  late int _counter;

  @override
  void initState() {
    _counter = 51;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lime,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Счетчик туда-сюда",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Для увеличения нажми +"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _counter -= 1;
                        });
                      },
                      icon:
                          Image(image: AssetImage("assets/images/minus.png"))),
                  Text(
                    _counter.toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _counter += 1;
                        });
                      },
                      icon: Image(image: AssetImage("assets/images/plus.png"))),
                ],
              ),
              const Text("Для уменьшения нажми -"),
            ],
          ),
        ),
      ),
    );
  }
}
