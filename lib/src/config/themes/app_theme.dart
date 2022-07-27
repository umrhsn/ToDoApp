import 'package:flutter/material.dart';
import 'package:to_do_app/src/config/themes/widgets/app_bar_theme.dart';
import 'package:to_do_app/src/config/themes/widgets/tab_bar_theme.dart';
import 'package:to_do_app/src/config/themes/widgets/text_field_theme.dart';
import 'package:to_do_app/src/config/themes/widgets/text_theme.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';

class AppThemes {
  static ThemeData appTheme({required bool isLight}) {
    return ThemeData(
        brightness: isLight ? Brightness.light : Brightness.dark,
        appBarTheme: AppBarThemes.appBarTheme(isLight: isLight),
        tabBarTheme: TabBarThemes.tabBarTheme(isLight: isLight),
        primaryColor: isLight ? AppColors.primaryLight : AppColors.primaryDark,
        primarySwatch: isLight
            ? AppColors.primarySwatchLight
            : AppColors.primarySwatchDark,
        scaffoldBackgroundColor: isLight ? Colors.white : Colors.black,
        fontFamily: AppStrings.fontFamily,
        textTheme: AppTextThemes.textTheme(isLight: isLight),
        inputDecorationTheme:
            AppTextFieldThemes.inputDecorationTheme(isLight: isLight));
  }
}
