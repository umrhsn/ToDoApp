import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/db_cubit.dart';
import 'package:to_do_app/db_state.dart';
import 'package:to_do_app/src/config/routes/app_routes.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/core/widgets/my_button_widget.dart';
import 'package:to_do_app/src/core/widgets/text_field_widget.dart';

class AddTaskContent extends StatefulWidget {
  const AddTaskContent({Key? key}) : super(key: key);

  @override
  State<AddTaskContent> createState() => _AddTaskContentState();
}

class _AddTaskContentState extends State<AddTaskContent> {
  final formKey = GlobalKey<FormState>();

  DateTime dateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour,
    DateTime.now().minute,
  );

  String _selectedRepeat = 'None';
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    final titleController = DatabaseCubit.get(context).titleController;
    final dateController = DatabaseCubit.get(context).dateController;
    final startTimeController = DatabaseCubit.get(context).startTimeController;
    final endTimeController = DatabaseCubit.get(context).endTimeController;
    final remindController = DatabaseCubit.get(context).remindController;
    final repeatController = DatabaseCubit.get(context).repeatController;

    Future<DateTime?> _getDateFromUser() async {
      return await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100));
    }

    Future<TimeOfDay?> _getTimeFromUser() async => await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        );

    void _setDateText() async {
      final date = await _getDateFromUser();

      if (date == null) return; // pressed cancel

      setState(() {
        dateTime = date;
        dateController.text =
            '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      });
    }

    void _setStartTimeText(String hour, String minute) async {
      final time = await _getTimeFromUser();

      if (time == null) return; // pressed cancel

      final newDateTime = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        time.hour,
        time.minute,
      );

      setState(() {
        dateTime = newDateTime;
        startTimeController.text = '$hour : $minute';
      });
    }

    void _setEndTimeText(String hour, String minute) async {
      final time = await _getTimeFromUser();

      if (time == null) return; // pressed cancel

      final newDateTime = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        time.hour,
        time.minute,
      );

      setState(() {
        dateTime = newDateTime;
        endTimeController.text = '$hour : $minute';
      });
    }

    List<PopupMenuItem> addTaskReminderMenuItems = [
      PopupMenuItem(
        value: 1,
        child: Text(AppStrings.reminderList[0]),
        onTap: () {
          remindController.text = AppStrings.reminderList[0];
        },
      ),
      PopupMenuItem(
        value: 2,
        child: Text(AppStrings.reminderList[1]),
        onTap: () {
          remindController.text = AppStrings.reminderList[1];
        },
      ),
      PopupMenuItem(
        value: 3,
        child: Text(AppStrings.reminderList[2]),
        onTap: () {
          remindController.text = AppStrings.reminderList[2];
        },
      ),
      PopupMenuItem(
        value: 4,
        child: Text(AppStrings.reminderList[3]),
        onTap: () {
          remindController.text = AppStrings.reminderList[3];
        },
      ),
    ];

    List<PopupMenuItem> addTaskRepeatMenuItems = [
      PopupMenuItem(
        value: 1,
        child: Text(AppStrings.repeatList[0]),
        onTap: () {
          repeatController.text = AppStrings.repeatList[0];
        },
      ),
      PopupMenuItem(
        value: 2,
        child: Text(AppStrings.repeatList[1]),
        onTap: () {
          repeatController.text = AppStrings.repeatList[1];
        },
      ),
      PopupMenuItem(
        value: 2,
        child: Text(AppStrings.repeatList[2]),
        onTap: () {
          repeatController.text = AppStrings.repeatList[2];
        },
      ),
      PopupMenuItem(
        value: 2,
        child: Text(AppStrings.repeatList[3]),
        onTap: () {
          repeatController.text = AppStrings.repeatList[3];
        },
      ),
    ];

    int nextH = dateTime.hour + 1;
    final String hour = dateTime.hour.toString().padLeft(2, '0');
    final String nextHour = nextH.toString().padLeft(2, '0');
    final String minute = dateTime.minute.toString().padLeft(2, '0');

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormFieldWidget(
                  readOnly: false,
                  controller: titleController,
                  label: AppStrings.titleTextFieldLabel,
                  hintText: 'Design team meeting',
                  suffixIcon: null,
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  controller: dateController,
                  label: AppStrings.dateTextFieldLabel,
                  hintText:
                      '${dateTime.year}-${dateTime.month}-${dateTime.day}',
                  suffixIconOnTap: _setDateText,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 25),
                Row(
                  // FIXME: time must be set twice in both textFields to be seen as text.
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        controller: startTimeController,
                        label: AppStrings.startTimeTextFieldLabel,
                        hintText: '$hour : $minute',
                        suffixIcon: Icons.access_time_rounded,
                        suffixIconOnTap: () => _setStartTimeText(hour, minute),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormFieldWidget(
                        controller: endTimeController,
                        label: AppStrings.endTimeTextFieldLabel,
                        hintText: '$nextHour : $minute',
                        suffixIcon: Icons.access_time_rounded,
                        suffixIconOnTap: () => _setEndTimeText(hour, minute),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  controller: remindController,
                  label: AppStrings.remindTextFieldLabel,
                  hintText: '10 minutes early',
                  suffixIconOnTapDown: (details) => _showPopupMenuAtPosition(
                      details, addTaskReminderMenuItems),
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  controller: repeatController,
                  label: AppStrings.repeatTextFieldLabel,
                  hintText: 'Weekly',
                  suffixIconOnTapDown: (details) =>
                      _showPopupMenuAtPosition(details, addTaskRepeatMenuItems),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          // TODO: make reusable component named ColorPickerWidget
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Color',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Wrap(
                children: List<Widget>.generate(4, (index) {
                  return GestureDetector(
                    onTap: () => setState(() => _selectedColor = index),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: index == 0
                            ? AppColors.tasksColorsList[0]
                            : index == 1
                                ? AppColors.tasksColorsList[1]
                                : index == 2
                                    ? AppColors.tasksColorsList[2]
                                    : AppColors.tasksColorsList[3],
                        child: _selectedColor == index
                            ? const Icon(Icons.done,
                                color: Colors.white, size: 16)
                            : Container(),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
          SizedBox(height: 53.h),
          // FIXME: due to having a SingleChildScrollView, the Column's MainAxisAlignment.spaceBetween is not effective
          BlocBuilder<DatabaseCubit, DatabaseState>(
            builder: (BuildContext context, state) {
              return MyButtonWidget(
                  onPressed: () {
                    DatabaseCubit.get(context).createTask();
                    Navigator.pushNamed(context, Routes.initialRoute);
                  },
                  label: AppStrings.createTaskButtonLabel);
            },
          ),
        ],
      ),
    );
  }

  void _showPopupMenuAtPosition(
      TapDownDetails details, List<PopupMenuItem> menuItems) {
    final position = details.globalPosition;
    _showPopupMenu(context, position, menuItems);
  }

  Future _showPopupMenu(BuildContext context, Offset offset,
      List<PopupMenuItem> menuItems) async {
    return await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
        items: menuItems);
  }
}
