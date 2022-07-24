import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/core/widgets/app_bar_widget.dart';
import 'package:to_do_app/src/features/add_task/presentation/widgets/add_task_content.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Widget _buildBodyContent() {
    return const Padding(padding: EdgeInsets.all(20), child: AddTaskContent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          leadingIcon: Icons.arrow_back,
          leadingIconOnTap: () => Navigator.pop(context),
          title: AppStrings.addTaskScreenTitle),
      body: _buildBodyContent(),
    );
  }
}
