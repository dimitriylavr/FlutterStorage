import 'package:flutter/material.dart';
import 'package:login_form/page/login_page.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Форма вохода',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title:''),
    );
  }
}