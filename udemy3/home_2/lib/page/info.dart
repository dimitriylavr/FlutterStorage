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
            //инфо
            ListTile(
              leading: Icon(Icons.person),
              title: Text("${userInfo.name}"),
              subtitle: Text("${userInfo.desc}"),
              trailing: Text("${userInfo.country}"),
            ),
            //телефон
            !userInfo.phone.isEmpty
                ? ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("${userInfo.phone}"),
                  )
                : SizedBox(),
            //почта
            !userInfo.email.isEmpty
                ? ListTile(
                    leading: Icon(Icons.mail),
                    title: Text("${userInfo.email}"),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
