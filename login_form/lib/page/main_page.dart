import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_form/const/color.dart';
import 'package:login_form/const/config.dart';
import 'package:login_form/page/new_main_page.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/mainPage";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List _loadOrder = [];

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse(baseUrl+'api/order/get?token='+token));
    final data = json.decode(response.body)['records'];
    //print(data);

    setState(() {
      _loadOrder = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Major Truck Dashboard"),
        backgroundColor: mainColor,
      ),
      body: SafeArea(
          child: _loadOrder.length == 0
              ? Center(
            child: ElevatedButton(
              child: Text("Загрузить данные"),
              onPressed: _fetchData,
            ),
          )
              : ListView.builder(
            itemCount: _loadOrder.length,
            itemBuilder: (BuildContext ctx, index) {
              return Card(
                color: Colors.white,
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading:
                  Image.network('https://via.placeholder.com/150/92c952',
                    //Image.network(_loadPhotos[index]["thumbnailUrl"],
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    '#${_loadOrder[index]['id']} - ${_loadOrder[index]['username']}',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 18),
                  ),
                  subtitle:
                  Text("Тел.: ${_loadOrder[index]["userphone"]}",
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),),
                  trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () =>
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => NewMainPage(_loadOrder[index]['id'])),
                                  (Route<dynamic> route) => false),
                      //print('Выбрали карточку: ${_loadPhotos[index]["phone"]}'),
                  ),
                ),
              );
            },
          )),
    );
  }
}
