import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

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
        Spacer(flex: 2),
        TimeCard(),
      ],
    );
  }
}

Container TimeCard() {
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
          padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Column(
            children: [
              DigitalClock(
                digitAnimationStyle: Curves.easeInOutBack,
                is24HourTimeFormat: true,
                areaDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                hourMinuteDigitDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                hourMinuteDigitTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
                secondDigitTextStyle:
                    TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
