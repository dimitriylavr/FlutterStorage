import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  LoginPage({Key? key, required this.title}):super(key: key);

  final String title;

  @override
  _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20);

  @override
  Widget build(BuildContext context) {
    final loginField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Логин',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    final passeorField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Пароль',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: null,
        child: Text("Войти",
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155,
                    child: Image.asset('assets/images/logo.png', fit: BoxFit.contain,),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  loginField,
                  SizedBox(height: 25,),
                  passeorField,
                  SizedBox(height: 35,),
                  loginButton,
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}