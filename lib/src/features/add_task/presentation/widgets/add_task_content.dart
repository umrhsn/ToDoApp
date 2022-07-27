import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/config/routes/app_routes.dart';
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
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final remindController = TextEditingController();
  final repeatController = TextEditingController();
  DateTime dateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour,
    DateTime.now().minute,
  );

  @override
  Widget build(BuildContext context) {
    List<PopupMenuItem> addTaskReminderMenuItems = [
      PopupMenuItem(
        value: 1,
        child: Text('10 min before'),
        onTap: () {
          remindController.text = '10 min before';
        },
      ),
      PopupMenuItem(
        value: 2,
        child: Text('30 min before'),
        onTap: () {
          remindController.text = '30 min before';
        },
      ),
      PopupMenuItem(
        value: 3,
        child: Text('1 hour before'),
        onTap: () {
          remindController.text = '1 hour before';
        },
      ),
      PopupMenuItem(
        value: 4,
        child: Text('1 day before'),
        onTap: () {
          remindController.text = '1 day before';
        },
      ),
    ];

    List<PopupMenuItem> addTaskRepeatMenuItems = [
      PopupMenuItem(
        value: 1,
        child: Text('Weekly'),
        onTap: () {
          repeatController.text = 'Weekly';
        },
      ),
      PopupMenuItem(
        value: 2,
        child: Text('Daily'),
        onTap: () {
          repeatController.text = 'Daily';
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
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  controller: dateController,
                  label: AppStrings.dateTextFieldLabel,
                  hintText:
                      '${dateTime.year}-${dateTime.month}-${dateTime.day}',
                  suffixIcon: Icons.keyboard_arrow_down_rounded,
                  suffixIconOnTap: _setDateText,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  textInputAction: TextInputAction.next,
                  controller: remindController,
                  label: AppStrings.remindTextFieldLabel,
                  hintText: '10 minutes early',
                  suffixIcon: Icons.keyboard_arrow_down_rounded,
                  suffixIconOnTapDown: (details) => _showPopupMenuAtPosition(
                      details, addTaskReminderMenuItems),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  textInputAction: TextInputAction.done,
                  controller: repeatController,
                  label: AppStrings.repeatTextFieldLabel,
                  hintText: 'Weekly',
                  suffixIcon: Icons.keyboard_arrow_down_rounded,
                  suffixIconOnTapDown: (details) =>
                      _showPopupMenuAtPosition(details, addTaskRepeatMenuItems),
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
          SizedBox(height: 116.h),
          // FIXME: due to having a SingleChildScrollView, the Column's MainAxisAlignment.spaceBetween is not effective, so temporarily I put SizedBox(height: 116.h)
          MyButtonWidget(
              onPressed: () {
                // TODO: create task in database
                Navigator.pushNamed(context, Routes.initialRoute);
              },
              label: AppStrings.createTaskButtonLabel),
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

  void _setDateText() async {
    final date = await _pickDate();

    if (date == null) return; // pressed cancel

    setState(() {
      dateTime = date;
      dateController.text =
          '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    });
  }

  void _setStartTimeText(String hour, String minute) async {
    final time = await _pickTime();

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
    final time = await _pickTime();

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

  Future<DateTime?> _pickDate() async {
    return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
  }

  Future<TimeOfDay?> _pickTime() async => await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );
}
