import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';

class TabBarThemes {
  static TabBarTheme tabBarTheme({required bool isLight}) {
    return TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isLight ? Colors.black : Colors.white,
            width: 3,
          ),
        ),
        // TODO: can't give a borderRadius to a non-uniform border
        // borderRadius: BorderRadius.circular(10),
      ),
      labelColor: isLight ? Colors.black : Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
    );
  }
}
