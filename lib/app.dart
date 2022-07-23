import 'package:flutter/material.dart';
import 'package:to_do_app/src/config/themes/app_theme.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/features/board/presentation/screens/board_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: AppStrings.appName,
          themeMode: ThemeMode.system,
          theme: AppThemes.appTheme(isLight: true),
          darkTheme: AppThemes.appTheme(isLight: false),
          home: const BoardScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
