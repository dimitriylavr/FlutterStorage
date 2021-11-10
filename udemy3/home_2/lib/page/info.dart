import 'package:flutter/material.dart';
import 'package:home_2/model/user.dart';

class UserPageInfo extends StatelessWidget {
  final User userInfo;
  UserPageInfo({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Информация о пользователе"),
      ),
      body: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text("${userInfo.name}"),
            ),
          ],
        ),
      ),
    );
  }
}
