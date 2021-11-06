import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Layout widget"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 60, top: 20),
              child: Text(
                "Текст для Padding",
                style: TextStyle(fontSize: 26),
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text("Это текст Align", style: TextStyle(fontSize: 20)),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                width: 200,
                height: 100,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(30),
                //color: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.amber[900],
                  border: Border.all(color: Colors.pink, width: 5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Это Container",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: Text(
                  "Text trxt",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Colors.blue,
                  size: 200,
                ),
                Positioned(top: 50, left: 50, child: Text("Wallet")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
