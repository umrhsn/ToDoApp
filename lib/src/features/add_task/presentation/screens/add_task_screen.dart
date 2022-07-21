import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/features/add_task/presentation/widgets/add_task_content.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Widget _buildBodyContent() {
    return const AddTaskContent();
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
