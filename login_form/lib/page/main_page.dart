import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_form/const/color.dart';
import 'package:login_form/const/config.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/mainPage";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List _loadPhotos = [];

  Future<void> _fetchData() async {


    final response = await http.get(Uri.parse(baseUrl));
    //print(response);
    final data = json.decode(response.body)['records'];
    print(data);

    setState(() {
      _loadPhotos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Major Truck Dashboard"),
        backgroundColor: mainColor,
      ),
      body: SafeArea(
          child: _loadPhotos.length == 0
              ? Center(
                  child: ElevatedButton(
                    child: Text("Загрузить данные"),
                    onPressed: _fetchData,
                  ),
                )
              : ListView.builder(
                  itemCount: _loadPhotos.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      color: Colors.white,
                      elevation: 10,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading:
                        Image.network('https://via.placeholder.com/150/92c952',
                        //Image.network(_loadPhotos[index]["thumbnailUrl"],
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          _loadPhotos[index]['name'],
                          style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                        ),
                        subtitle:
                            Text("Телефон: ${_loadPhotos[index]["phone"]}"),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () => print(
                              'Выбрали карточку: ${_loadPhotos[index]["phone"]}'),
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
