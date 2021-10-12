import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  LoginPage({Key? key, required this.title}):super(key: key);

  final String title;

  @override
  _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20);
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginField = TextField(
      obscureText: false,
      style: style,
      controller: loginController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffEEEEEE),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Логин',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    final passeorField = TextField(
      controller: passwordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffEEEEEE),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Пароль',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Color(0xffbf2038),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: ()=> print('Логин: ${loginController.text}  | Пароль: ${passwordController.text}'),
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
            //color: Colors.blueAccent,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 150,
                    child: Image.asset('assets/images/logo.png', fit: BoxFit.contain,),
                  ),
                  SizedBox(
                    height: 100,
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
      backgroundColor: Color(0xff17325c),
    );
  }
}