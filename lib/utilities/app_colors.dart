import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryColorValue = 0xFF202020;

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);
  static const Color primaryColor = Color(0xFF048434);
  static const Color secondaryColor = Color(0xFF627D34);
  static const Color fontGrey = Color(0xFF606E7B);
  static const Color green = Color(0xFF98C22A);
  static const Color lightGreen = Color(0xFF7E801B);
  static const Color grey = Color(0xFF606060);
  static const Color gradient = Color(0xFFFFFFFF);
  static const Color iconGrey = Color(0xFFC8C8C8);
  static const Color textFieldColor = Color(0xFFF3F3F3);
  static const Color silverColor = Color(0xFF8C8C8C);
  static const Color lightGrey = Color(0xFFB8B8B8);
  static const Color darkGrey = Color(0xFF636363);
  static const Color textBlack = Color(0xFF171616);
  static const Color lightPink = Color(0xFFFFFFED);
  static const Color measureBorder = Color.fromRGBO(217, 224, 199, 1);
  static const Color darkGreen = Color(0xFF47571D);
  static const Color red = Color(0xFFE12626);
  static const Color filterGrey = Color(0xFFEAEAEA);
  static const Color yellow = Color(0xFFFFD600);
  static const Color darkGrey2 = Color(0xFFD0D0D0);
  static const Color yellowGreen = Color(0xFF80805C);
  static const Color brownishGreen = Color(0xFF383810);
  static const Color lightOlive = Color(0xFFB9C795);
  static const Color yellowishGreen = Color(0xFFB4C783);

  static const Color prim1 = Color(0xFFc4e2d1);
  static const Color prim2 = Color(0xFF5dae7f);
  static const Color prim3 = Color(0xFF84c49c);
  static const Color prim4 = Color(0xFF379c62);
  static const Color prim5 = Color(0xFF1a8c4c);

  static const MaterialColor primarySwatch = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFF202470),
      100: Color(0xFF202420),
      200: Color(0xFF201D20),
      300: Color(0xFF201E20),
      400: Color(0xFF201F20),
      500: Color(_primaryColorValue),
      600: Color(0xFF202120),
      700: Color(0xFF202220),
      800: Color(0xFF202320),
      900: Color(0xFF202420),
    },
  );
}
