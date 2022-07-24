import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextThemes {
  static TextTheme textTheme({required bool isLight}) {
    return TextTheme(
      bodyMedium: TextStyle(
          fontSize: 14.sp, color: isLight ? Colors.black : Colors.white),
    );
  }
}
