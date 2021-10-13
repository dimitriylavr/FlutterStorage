import 'package:flutter/material.dart';
import 'package:login_form/const/color.dart';
import 'package:login_form/page/main_page.dart';
import 'package:shimmer/shimmer.dart';

class NewMainPage extends StatefulWidget {
  static const routeName = "newMainPage";

  @override
  _NewMainPageState createState() => _NewMainPageState();
}

class _NewMainPageState extends State<NewMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Text(
          "Список заявок",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (BuildContext ctx, index) {
              int timer = 1000;
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                period: Duration(milliseconds: timer),
                child: box(),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => MainPage()),
                (Route<dynamic> route) => false),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget box() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
