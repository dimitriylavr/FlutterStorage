import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MobileViewHomePage extends StatefulWidget {
  @override
  _MobileViewHomePageState createState() => _MobileViewHomePageState();
}

class _MobileViewHomePageState extends State<MobileViewHomePage> {
  //String url = 'https://www.hpb.health.gov.lk/api/get-current-statistical';
  String url =
      'http://administrator@12033021:10.25.1.219:2376/mjr/hs/api/v3/monitor';
  var data;

  String? hospital_name;

  @override
  void initState() {
    super.initState();
    this.getJSONdata();
  }

  Future<String> getJSONdata() async {
    var response = await http.get(Uri.parse(url));
    setState(() {
      var jsonFile = jsonDecode(response.body);
      data = jsonFile['data'];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        return OrientationBuilder(builder: (context, orientation) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Center(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Монитор состояния',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Last Updated ${data[0]}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
