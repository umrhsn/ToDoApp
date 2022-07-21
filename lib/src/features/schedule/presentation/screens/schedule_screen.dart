import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/features/schedule/presentation/widgets/schedule_content.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  Widget _buildBodyContent() {
    return const ScheduleContent();
  }

  final appBar = AppBar(title: const Text(AppStrings.appName));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: _buildBodyContent(),
    );
  }
}
