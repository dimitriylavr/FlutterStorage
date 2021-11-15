import 'package:flutter/material.dart';

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
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Text(
            "10:00:00",
            style: TextStyle(fontSize: 34),
          ),
        )
      ],
    ),
  );
}
