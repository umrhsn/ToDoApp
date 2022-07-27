import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';

class AppTextFieldThemes {
  static InputDecorationTheme inputDecorationTheme({required bool isLight}) {
    return InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
      hintStyle: TextStyle(
          color: isLight ? AppColors.hintColorLight : AppColors.hintColorDark),
      filled: true,
      fillColor: isLight
          ? AppColors.textFormFieldColorLight
          : AppColors.textFormFieldColorDark,
      prefixIconColor:
          isLight ? AppColors.hintColorLight : AppColors.hintColorDark,
      suffixIconColor:
          isLight ? AppColors.hintColorLight : AppColors.hintColorDark,
    );
  }
}
