import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/db_cubit.dart';
import 'package:to_do_app/db_state.dart';
import 'package:to_do_app/src/config/routes/app_routes.dart';
import 'package:to_do_app/src/core/services/date_time_service.dart';
import 'package:to_do_app/src/core/services/notification_service.dart';
import 'package:to_do_app/src/core/services/popup_menu_service.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/core/widgets/my_button_widget.dart';
import 'package:to_do_app/src/core/widgets/text_field_widget.dart';
import 'package:to_do_app/src/features/add_task/presentation/widgets/color_picker_widget.dart';

class AddTaskContent extends StatefulWidget {
  const AddTaskContent({Key? key}) : super(key: key);

  @override
  State<AddTaskContent> createState() => _AddTaskContentState();
}

class _AddTaskContentState extends State<AddTaskContent> {
  final formKey = GlobalKey<FormState>();

  DateTime _dateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour,
    DateTime.now().minute,
  );

  DateTime? _startTime;
  DateTime? _endTime;
  Duration? _timeDifference;

  String _selectedRepeat = 'None';

  // ignore: prefer_final_fields
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    final titleController = DatabaseCubit.get(context).titleController;
    final dateController = DatabaseCubit.get(context).dateController;
    final startTimeController = DatabaseCubit.get(context).startTimeController;
    final endTimeController = DatabaseCubit.get(context).endTimeController;
    final remindController = DatabaseCubit.get(context).remindController;
    final repeatController = DatabaseCubit.get(context).repeatController;

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

    int nextH = _dateTime.hour == 23 ? 0 : _dateTime.hour + 1;
    final String hour = _dateTime.hour.toString().padLeft(2, '0');
    final String nextHour = nextH.toString().padLeft(2, '0');
    final String minute = _dateTime.minute.toString().padLeft(2, '0');

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                buildTitleField(titleController),
                const SizedBox(height: 25),
                buildDateField(dateController, context),
                const SizedBox(height: 25),
                Row(
                  children: [
                    buildStartTimeField(
                        startTimeController, hour, minute, context),
                    const SizedBox(width: 20),
                    buildEndTimeField(
                        endTimeController, nextHour, minute, context, hour),
                  ],
                ),
                const SizedBox(height: 25),
                buildReminderField(
                    remindController, context, addTaskReminderMenuItems),
                const SizedBox(height: 25),
                buildRepeatField(
                    repeatController, context, addTaskRepeatMenuItems),
              ],
            ),
          ),
          const SizedBox(height: 25),
          ColorPickerWidget(selectedColor: _selectedColor),
          SizedBox(height: 53.h),
          // FIXME: due to having a SingleChildScrollView, the Column's MainAxisAlignment.spaceBetween is not effective
          buildButton(titleController),
        ],
      ),
    );
  }

  BlocBuilder<DatabaseCubit, DatabaseState> buildButton(
      TextEditingController titleController) {
    return BlocBuilder<DatabaseCubit, DatabaseState>(
      builder: (BuildContext context, state) {
        return MyButtonWidget(
            onPressed: () {
              NotificationService(_dateTime).scheduleAlarm();
              Fluttertoast.showToast(
                  msg:
                      // FIXME: need a better logic for calculating time difference, and making endTime and startTime listen to day value which they don't
                      'task "${titleController.text}" is set for ${_endTime!.difference(_startTime!).inDays} days, ${_endTime!.difference(_startTime!).inHours} hours and ${_endTime!.difference(_startTime!).inMinutes} minutes from now.',
                  toastLength: Toast.LENGTH_LONG);
              DatabaseCubit.get(context).createTask();
              Navigator.pushNamed(context, Routes.initialRoute);
            },
            label: AppStrings.createTaskButtonLabel);
      },
    );
  }

  TextFieldWidget buildRepeatField(
      TextEditingController repeatController,
      BuildContext context,
      List<PopupMenuItem<dynamic>> addTaskRepeatMenuItems) {
    return TextFieldWidget(
      controller: repeatController,
      label: AppStrings.repeatTextFieldLabel,
      hintText: 'Weekly',
      suffixIconOnTapDown: (details) => PopupMenuService(context)
          .showPopupMenuAtPosition(details, addTaskRepeatMenuItems),
    );
  }

  TextFieldWidget buildReminderField(
      TextEditingController remindController,
      BuildContext context,
      List<PopupMenuItem<dynamic>> addTaskReminderMenuItems) {
    return TextFieldWidget(
      controller: remindController,
      label: AppStrings.remindTextFieldLabel,
      hintText: '10 minutes early',
      suffixIconOnTapDown: (details) => PopupMenuService(context)
          .showPopupMenuAtPosition(details, addTaskReminderMenuItems),
    );
  }

  Expanded buildEndTimeField(TextEditingController endTimeController,
      String nextHour, String minute, BuildContext context, String hour) {
    return Expanded(
      child: TextFieldWidget(
        controller: endTimeController,
        label: AppStrings.endTimeTextFieldLabel,
        hintText: '$nextHour : $minute',
        suffixIcon: Icons.access_time_rounded,
        // FIXME: An endTime with a -ve time difference from startTime shouldn't be accepted
        onTap: () async {
          _endTime = await DateTimeService(dateTime: _dateTime).setTimeText(
              context,
              controller: endTimeController,
              hour: hour,
              minute: minute);
          setState(() {
            _dateTime = _endTime ?? _dateTime;
            _timeDifference = _endTime!.difference(_startTime!);
          });
          debugPrint('endTime = $_endTime}');
          debugPrint(
              '_timeDifference.isNegative = ${_timeDifference!.isNegative}');
        },
        keyboardType: TextInputType.datetime,
      ),
    );
  }

  Expanded buildStartTimeField(TextEditingController startTimeController,
      String hour, String minute, BuildContext context) {
    return Expanded(
      child: TextFieldWidget(
        controller: startTimeController,
        label: AppStrings.startTimeTextFieldLabel,
        hintText: '$hour : $minute',
        suffixIcon: Icons.access_time_rounded,
        onTap: () async {
          _startTime = await DateTimeService(dateTime: _dateTime).setTimeText(
              context,
              controller: startTimeController,
              hour: hour,
              minute: minute);
          setState(() => _dateTime = _startTime ?? _dateTime);
          debugPrint('startTime = $_startTime}');
        },
        keyboardType: TextInputType.datetime,
      ),
    );
  }

  TextFieldWidget buildDateField(
      TextEditingController dateController, BuildContext context) {
    return TextFieldWidget(
      controller: dateController,
      label: AppStrings.dateTextFieldLabel,
      hintText: '${_dateTime.year}-${_dateTime.month}-${_dateTime.day}',
      onTap: () async {
        var newDate = await DateTimeService(dateTime: _dateTime)
            .setDateText(context, dateController);
        setState(() => _dateTime = newDate ?? _dateTime);
      },
      keyboardType: TextInputType.datetime,
    );
  }

  TextFieldWidget buildTitleField(TextEditingController titleController) {
    return TextFieldWidget(
      readOnly: false,
      controller: titleController,
      label: AppStrings.titleTextFieldLabel,
      hintText: 'Design team meeting',
      suffixIcon: null,
    );
  }
}
