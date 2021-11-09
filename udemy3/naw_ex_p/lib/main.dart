import 'package:flutter/material.dart';
import 'package:naw_ex_p/first_screen.dart';
import 'package:naw_ex_p/second_screen.dart';

void main() {
  runApp(MaterialApp(
    home: FirsScreen(),
    routes: {
      "/page2": (context) => SecondScreen(),
    },
  ));
}
