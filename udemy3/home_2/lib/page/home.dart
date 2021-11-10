import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _descriptController = TextEditingController();
  final _passController = TextEditingController();

  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Форма регистрации",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Center(
              child: Text(
                "Заполните данные формы",
                style: TextStyle(color: Colors.cyan, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //имя
            TextFormField(
              controller: _nameController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Ваше имя",
                prefixIcon: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                ),
                suffixIcon: Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
                enabledBorder: _enabledBorder(),
                focusedBorder: _focusedBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //телефон
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: "Номер телефона",
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
                enabledBorder: _enabledBorder(),
                focusedBorder: _focusedBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //почта
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Адрес почты",
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.blue,
                ),
                enabledBorder: _enabledBorder(),
                focusedBorder: _focusedBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //страна
            TextFormField(),
            SizedBox(
              height: 10,
            ),
            //описание
            TextFormField(
              controller: _countryController,
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: "О себе",
                prefixIcon: Icon(
                  Icons.text_fields,
                  color: Colors.blue,
                ),
                enabledBorder: _enabledBorder(),
                focusedBorder: _focusedBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //пароль
            TextFormField(
              controller: _passController,
              maxLength: 16,
              obscureText: _hidePass,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.shield,
                  color: Colors.blue,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePass = !_hidePass;
                      });
                    },
                    icon: Icon(
                        _hidePass ? Icons.visibility : Icons.visibility_off)),
                labelText: "Пароль",
                enabledBorder: _enabledBorder(),
                focusedBorder: _focusedBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Зарегистрироваться",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder _enabledBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Colors.cyan));
}

OutlineInputBorder _focusedBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Colors.black));
}
