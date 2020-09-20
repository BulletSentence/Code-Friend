import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

const kPrimaryColor = Colors.amber;
const kPrimaryLightColor = Color(0x300745FF);

const kInputFieldFillColor = const Color.fromARGB(255, 241, 239, 239);
const kBoxFormPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 20);
const kFormPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20);
const kScaffoldBackgroundColor = const Color.fromARGB(255, 241, 239, 239);
const kTextColor = Colors.black54;

