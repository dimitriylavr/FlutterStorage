import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class MyApp extends StatelessWidget {
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
        body: CounterApp(),
      ),
    );
  }
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
              const Text(
                "-  уменьшает",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (_counter <= 0) {
                            _counter = 0;
                          } else {
                            _counter--;
                          }
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
                          _counter++;
                        });
                      },
                      icon: Image(image: AssetImage("assets/images/plus.png"))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                "+ увеличивает",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
