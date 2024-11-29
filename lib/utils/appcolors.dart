import 'package:flutter/material.dart';

class Appcolors {
  static const Color darkGrey = Color(0xFF3C3C3C);
  static const Color red = Color(0xFFFF5858);
  static const Color pink = Color(0xFFFF857A6);
  static const Color lightgrey = Color(0xFFF5F5F5);
  static const Color grey = Color(0xFF828282);
  static const Color greys = Color(0xFFDEDEDE);
  static const Color greyss = Color(0xFF6F6F6F);
  static const Color gray = Color(0xFF8D8D8D);
  static const Color lightpink = Color(0xFFFF5A5F);
  static const Color blue = Color(0xFFC1839F);
  static const Color agrey = Color(0xFF5F5F5F);
  static const Color blueaccent = Color(0xFFD4E4E6);
  static const Color bgrey = Color(0xFF3C3C3C);
}

class AppGradient {
  final Color LightShade;
  final Color DarkShade;
  AppGradient(this.DarkShade, this.LightShade);
}

AppGradient backgroundColor = AppGradient(
  const Color(0xFFFF5858),
  const Color(0xFFFF857A6),
);
