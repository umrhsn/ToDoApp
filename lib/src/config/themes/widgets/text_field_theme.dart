import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';

class AppTextFieldThemes {
  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
      hintStyle: const TextStyle(color: AppColors.hintColor),
      filled: true,
      fillColor: AppColors.textFormFieldColor,
      prefixIconColor: AppColors.hintColor,
      suffixIconColor: AppColors.hintColor,
    );
  }
}
