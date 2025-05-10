// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppTheme {
  // white color theme
  // static const Color primaryColor = Color(0xFF00afe7);
  // static const Color secondColor = Color(0xFFf7f7f7);
  // static const Color backgroundColor = Color(0xFFf9f9f9);
  // static const Color whiteColor = Color(0xFFffffff);
  // static const Color blackColor = Color(0xFF000000);
  // static const Color black50Color = Color(0xFFa6a6a6);
  // static const Color black50IIColor = Color(0xFF999999);
  // static const Color redColor = Color.fromARGB(255, 255, 0, 0);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF00afe7),
    primaryColorLight: const Color(0xFFffffff),
    primaryColorDark: const Color(0xFF000000),
    backgroundColor: const Color(0xFFf9f9f9),
    hintColor: const Color(0xFF999999),
    secondaryHeaderColor: const Color.fromARGB(255, 255, 0, 0),
    cardColor: const Color(0xFF909497),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF00afe7),
    primaryColorLight: const Color(0xFFffffff),
    primaryColorDark: const Color(0xFF000000),
    backgroundColor: const Color(0xFF1f242d),
    hintColor: const Color(0xFF9e9e9e),
    secondaryHeaderColor: const Color.fromARGB(255, 255, 0, 0),
    cardColor: const Color(0xFF909497),
  );
}
