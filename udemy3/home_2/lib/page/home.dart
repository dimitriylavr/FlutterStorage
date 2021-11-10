import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_2/model/user.dart';
import 'package:home_2/page/info.dart';

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _descriptController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _hidePass = true;

  User newUser = User();

  List<String> _country = ['Russia', 'Spain', 'France', 'Germany'];
  String _selectedCountry = 'Russia';

  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _descriptController.dispose();
    _passController.dispose();

    super.dispose();
  }

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
        key: _formKey,
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
              validator: _validatorName,
              onSaved: (value) => newUser.name = value!,
              decoration: InputDecoration(
                labelText: "Ваше имя",
                prefixIcon: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                ),
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    _nameController.clear();
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
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
              onSaved: (value) => newUser.phone = value!,
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
              onSaved: (value) => newUser.email = value!,
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
            DropdownButtonFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.flag,
                  color: Colors.blue,
                ),
                enabledBorder: _enabledBorder(),
              ),
              items: _country.map((country) {
                return DropdownMenuItem(
                  child: Text(country),
                  value: country,
                );
              }).toList(),
              onChanged: (country) {
                setState(() {
                  _selectedCountry = country as String;
                  newUser.country = _selectedCountry;
                });
              },
              value: _selectedCountry,
            ),
            SizedBox(
              height: 10,
            ),
            //описание
            TextFormField(
              controller: _descriptController,
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              onSaved: (value) => newUser.desc = value!,
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
              onPressed: () {
                _submitForm();
              },
              child: Text(
                "Зарегистрироваться",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserPageInfo(userInfo: newUser)));
    } else {
      print("Есть ошибки");
    }
  }

  String? _validatorName(String? value) {
    final _nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Заполните поле!';
    } else if (!_nameExp.hasMatch(value)) {
      return 'В имени недопустимые символы';
    } else {
      return null;
    }
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
