import 'package:flutter/material.dart';

class AppColors {
  static int primaryLightInt = 0xFF6FC26D;
  static int primaryDarkInt = 0xFF4e884c;

  static Color primaryLight = Color(primaryLightInt);
  static Color primaryDark = Color(primaryDarkInt);

  static MaterialColor primarySwatchLight = MaterialColor(
    primaryLightInt, //0%
    const <int, Color>{
      50: Color(0xff7dc87c), //10%
      100: Color(0xff8cce8a), //20%
      200: Color(0xff9ad499), //30%
      300: Color(0xffa9daa7), //40%
      400: Color(0xffb7e1b6), //50%
      500: Color(0xffc5e7c5), //60%
      600: Color(0xffd4edd3), //70%
      700: Color(0xffe2f3e2), //80%
      800: Color(0xfff1f9f0), //90%
      900: Color(0xffffffff), //100%
    },
  );
  static MaterialColor primarySwatchDark = MaterialColor(
    primaryDarkInt, //0%
    const <int, Color>{
      50: Color(0xff64af62), //10%
      100: Color(0xff599b57), //20%
      200: Color(0xff4e884c), //30%
      300: Color(0xff437441), //40%
      400: Color(0xff386137), //50%
      500: Color(0xff2c4e2c), //60%
      600: Color(0xff213a21), //70%
      700: Color(0xff162716), //80%
      800: Color(0xff0b130b), //90%
      900: Color(0xff000000), //100%
    },
  );

  static Color shadowLight = Colors.grey.shade500;
  static Color shadowDark = Colors.grey.shade200;

  static Color textFormFieldColorLight = Colors.grey.shade100;
  static Color textFormFieldColorDark = Colors.grey.shade800;
  static const Color hintColorLight = Color(0xFFC0C0C0);
  static const Color hintColorDark = Color(0xFFA2A2A2);

  /// [tasksColorsList] to be used in [BoardScreen] and [ScheduleScreen]
  static List<Color> tasksColorsList = [
    const Color(0xFFE35246),
    const Color(0xFFEC9A42),
    const Color(0xFFF5C511),
    const Color(0xFF42A0FE),
  ];
}
