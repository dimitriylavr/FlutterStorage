import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_form/const/color.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/mainPage";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List _loadPhotos = [];

  Future<void> _fetchData() async {
    const API_URL = 'https://jsonplaceholder.typicode.com/photos';

    final response = await http.get(Uri.parse(API_URL));
    final data = json.decode(response.body);

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
                    return ListTile(
                      leading: Image.network(
                        _loadPhotos[index]["thumbnailUrl"],
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      title: Text(_loadPhotos[index]['title']),
                      subtitle: Text("Photo ID: ${_loadPhotos[index]["id"]}"),
                    );
                  },
                )),
    );
  }
}
