import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "images/logo.png",
          width: 250,
        ),
        const Spacer(flex: 2),
        const Text(
          "Приемка",
          style: TextStyle(fontSize: 50),
        ),
        const Spacer(flex: 2),
        TimeCard(context),
      ],
    );
  }
}

Container TimeCard(context) {
  var now = DateTime.now();
  var formatter = DateFormat('dd/MM/yyyy').format(now);

  return Container(
    margin: const EdgeInsets.only(left: defaultPadding),
    padding: const EdgeInsets.symmetric(
      horizontal: defaultPadding,
      vertical: defaultPadding / 2,
    ),
    decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Colors.white10),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Column(
            children: [
              Text(
                formatter,
                style: const TextStyle(fontSize: 20),
              ),
              DigitalClock(
                digitAnimationStyle: Curves.easeInOutBack,
                is24HourTimeFormat: true,
                areaDecoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                hourMinuteDigitDecoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                hourMinuteDigitTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
                secondDigitTextStyle:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
