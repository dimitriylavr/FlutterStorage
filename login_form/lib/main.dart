import 'package:flutter/material.dart';
import 'package:login_form/page/login_page.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget{
  //const color_main = const Color(0xff17325c);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Форма вохода',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginPage(title:''),
    );
  }
}