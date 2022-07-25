import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';
import 'package:to_do_app/src/core/utils/media_query_values.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({
    Key? key,
    required this.startDate,
    required this.selectedValue,
    required this.initialSelectedDate,
  }) : super(key: key);

  DateTime startDate;
  DateTime selectedValue;
  DateTime initialSelectedDate;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    bool isLight = context.platformBrightness == Brightness.light;
    Color textColor = isLight ? Colors.black : Colors.white;

    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
      child: DatePicker(
        widget.startDate,
        height: 80,
        initialSelectedDate: widget.initialSelectedDate,
        // TODO: make it the date of the first task added
        selectionColor: AppColors.primary,
        selectedTextColor: Colors.white,
        dayTextStyle: TextStyle(fontSize: 10, color: textColor),
        monthTextStyle: TextStyle(fontSize: 10, color: textColor),
        dateTextStyle: TextStyle(fontSize: 15, color: textColor),
        onDateChange: (date) {
          // New date selected
          setState(() {
            widget.selectedValue = date;
          });
        },
      ),
    );
  }
}
