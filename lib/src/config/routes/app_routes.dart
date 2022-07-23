import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/features/add_task/presentation/screens/add_task_screen.dart';
import 'package:to_do_app/src/features/board/presentation/screens/board_screen.dart';
import 'package:to_do_app/src/features/schedule/presentation/screens/schedule_screen.dart';

class Routes {
  static const String initialRoute = '';
  static const String addTaskRoute = 'addTask';
  static const String scheduleRoute = 'schedule';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const BoardScreen());
      case Routes.addTaskRoute:
        return MaterialPageRoute(builder: (context) => const AddTaskScreen());
      case Routes.scheduleRoute:
        return MaterialPageRoute(builder: (context) => const ScheduleScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (context) =>
            const Scaffold(body: Center(child: Text(AppStrings.noRouteFound))));
  }
}
