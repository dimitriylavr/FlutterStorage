import 'package:flutter/material.dart';
import 'package:home_2/page/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      title: "Регистрация пользователя",
      home: HomePage(),
    );
  }
}
