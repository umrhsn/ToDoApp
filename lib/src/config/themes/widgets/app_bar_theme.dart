import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';

class AppBarThemes {
  static AppBarTheme appBarTheme({required bool isLight}) {
    SystemUiOverlayStyle systemOverlayStyle = isLight
        ? const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          )
        : const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
          );

    return AppBarTheme(
      systemOverlayStyle: systemOverlayStyle,
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
      shadowColor: isLight ? Colors.grey.shade500 : Colors.grey.shade200,
    );
  }
}
