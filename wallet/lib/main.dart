import 'package:flutter/material.dart';

void main() {

}

class WalletApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кошелёчек',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: MainPage(),
    );
  }
}



