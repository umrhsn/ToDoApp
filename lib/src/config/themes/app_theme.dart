import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/config/themes/widgets/app_bar_theme.dart';
import 'package:to_do_app/src/config/themes/widgets/tab_bar_theme.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';

class AppThemes {
  static ThemeData appTheme({required bool isLight}) {
    return ThemeData(
      brightness: isLight ? Brightness.light : Brightness.dark,
      appBarTheme: AppBarThemes.appBarTheme(isLight: isLight),
      tabBarTheme: TabBarThemes.tabBarTheme(isLight: isLight),
      primaryColor: AppColors.primary,
      primarySwatch: AppColors.primarySwatch,
      scaffoldBackgroundColor: isLight ? Colors.white : Colors.black,
      fontFamily: AppStrings.fontFamily,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
            fontSize: 16.sp, color: isLight ? Colors.black : Colors.white),
      ),
    );
  }
}
