import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_form/const/color.dart';
import 'package:login_form/page/main_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20);
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    signIn(String login, pass) async {
      print("Логин: $login");
      print("пароль: $pass");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => MainPage()),
          (Route<dynamic> route) => false);
    }

    final loginField = TextField(
      obscureText: false,
      style: style,
      controller: loginController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffEEEEEE),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Логин',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final passwordField = TextField(
      controller: passwordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffEEEEEE),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Пароль',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xffbf2038),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        //onPressed: ()=> print('Логин: ${loginController.text}  | Пароль: ${passwordController.text}'),
        onPressed: loginController.text == "" || passwordController.text == ""
            ? null
            : () {
                signIn(loginController.text, passwordController.text);
              },
        child: Text(
          "Войти",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            //color: Colors.blueAccent,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 150,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  loginField,
                  SizedBox(
                    height: 25,
                  ),
                  passwordField,
                  SizedBox(
                    height: 35,
                  ),
                  loginButton,
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: mainColor,
    );
  }
}
