import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/features/board/presentation/screens/board_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BoardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
