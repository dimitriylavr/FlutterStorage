import 'package:flutter/material.dart';
import 'package:naw_ex_p/users.dart';

class FirsScreen extends StatefulWidget {
  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirsScreen> {
  String txtName = "Сюда будем принимать текст";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Главное окно")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                txtName,
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _returnDataScreen(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text("Переход далее")),
          ],
        ),
      ),
    );
  }

  void _returnDataScreen(BuildContext context) async {
    User user = User(name: "Дмитрий", age: 37);
    final result =
        await Navigator.pushNamed(context, "/page2", arguments: user);

    setState(() {
      txtName = result.toString();
    });
  }
}
/*
class FirsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First screen"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            User user = User(name: "Dmitrii", age: 37);
            Navigator.pushNamed(context, "/page2", arguments: user);
          },
          child: Text("Go to second screen"),
        ),
      ),
    );
  }
}*/
