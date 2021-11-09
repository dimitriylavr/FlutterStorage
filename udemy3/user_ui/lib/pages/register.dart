import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register form",
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Form(
          child: ListView(
        padding: EdgeInsets.all(10),
        children: [],
      )),
    );
  }
}
