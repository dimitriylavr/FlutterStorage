import 'package:calculator/config/conf.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Калькулятор ИМТ",
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: containerColor,
                fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: Column(
                      children: [
                        TextField(
                          controller: _heightController,
                          style: const TextStyle(
                              fontSize: 42,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                              color: containerColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Рост",
                            hintStyle: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(.8)),
                          ),
                        ),
                        Text(
                          "сантиметры",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Montserrat',
                              color: Colors.white.withOpacity(.8)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 130,
                    child: Column(
                      children: [
                        TextField(
                          controller: _weightController,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 42,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                              color: containerColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Вес",
                            hintStyle: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(.8)),
                          ),
                        ),
                        Text(
                          "килограммы",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Montserrat',
                              color: Colors.white.withOpacity(.8)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              MaterialButton(
                onPressed: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                    _h = _h / 100;
                    _h *= _h;
                    setState(() {
                      _bmiResult = _w / _h;
                      if (_bmiResult > 25) {
                        _textResult = "У тебя лишний вес!";
                      } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                        _textResult = "Твой вес нормальный!";
                      } else {
                        _textResult = "Недостаточный вес!";
                      }
                    });
                },
                textColor: Colors.white,
                padding: EdgeInsets.all(0.0),
                child: Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(10),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Расчитать",
                        style: TextStyle(
                            fontSize: 28, color: mainColor, letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 90,
                    color: containerColor),
              ),
              const SizedBox(
                height: 60,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                child: Text(
                  _textResult,
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: warnColor),
                ),
              ),
            ],
          ),
        ));
  }
}
