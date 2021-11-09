import 'package:flutter/material.dart';
import 'package:naw_ex_p/users.dart';

class SecondScreen extends StatelessWidget {
  TextEditingController txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(title: Text("Ваше имя: ${args.name} - ${args.age}")),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: TextField(
                controller: txtController,
              ),
            ),
            ElevatedButton(
              child: Text("Go back"),
              onPressed: () {
                String textBack = txtController.text;
                Navigator.pop(context, textBack);
              },
            ),
          ],
        ),
      ),
    );
  }
}
