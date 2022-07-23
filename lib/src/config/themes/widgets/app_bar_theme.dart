import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/config/themes/system/system_overlay_style.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';

class AppBarThemes {
  static AppBarTheme appBarTheme({required bool isLight}) {
    return AppBarTheme(
      systemOverlayStyle:
          AppSystemUiOverlayStyle.setSystemUiOverlayStyle(isLight: isLight),
      backgroundColor: isLight ? Colors.white : Colors.black,
      titleSpacing: 25.w,
      titleTextStyle: TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontSize: 20.sp,
        color: isLight ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(
        color: isLight ? Colors.black : Colors.white,
      ),
      elevation: 1,
      shadowColor: isLight ? AppColors.shadowLight : AppColors.shadowDark,
    );
  }
}
