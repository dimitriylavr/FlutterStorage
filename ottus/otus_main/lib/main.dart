import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: const Text("Flutter App"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "Это тело приложения",
            style: TextStyle(
                fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
