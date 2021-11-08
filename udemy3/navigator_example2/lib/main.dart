import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const FirstHome(),
      routes: {
        "/first": (context) => FirstHome(),
        "/second": (context) => SecondHome()
      },
    ),
  );
}

class FirstHome extends StatelessWidget {
  const FirstHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First home"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            User user = User(name: "Dmitrii", age: 28);
            Navigator.pushNamed(context, "/second", arguments: user);
          },
          child: Text("Second home"),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  const SecondHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text("${settings.name} - ${settings.age.toString()}"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("First home"),
        ),
      ),
    );
  }
}

class User {
  String? name;
  int? age;

  User({this.name, this.age});
}
