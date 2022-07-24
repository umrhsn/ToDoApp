import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6FC26D);
  static const MaterialColor primarySwatch = Colors.green;
  static Color shadowLight = Colors.grey.shade500;
  static Color shadowDark = Colors.grey.shade200;

  /// [tasksColorsList] to be used in [BoardScreen] and [ScheduleScreen]
  static List<Color> tasksColorsList = [
    const Color(0xFFE35246),
    const Color(0xFFEC9A42),
    const Color(0xFFF5C511),
    const Color(0xFF42A0FE),
  ];
}
