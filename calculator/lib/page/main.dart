import 'package:calculator/config/conf.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Калькулятор ИМТ",
            style:
                TextStyle(color: containerColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
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
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
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
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  _h = _h / 100;
                  _h *= _h;
                  setState(() {
                    print(_h);
                    print(_w);
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
                child: const Text(
                  "Расчитать",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: containerColor
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: containerColor),
              ),
              const SizedBox(
                height: 60,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                child: Text(
                  _textResult,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color:warnColor
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
