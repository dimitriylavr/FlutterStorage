import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(Text("Second screen")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go back"),
          onPressed: () {},
        ),
      ),
    );
  }
}
