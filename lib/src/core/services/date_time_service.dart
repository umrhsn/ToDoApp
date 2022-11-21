import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DateTimeService {
  DateTime dateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour,
    DateTime.now().minute,
  );

  DateTimeService({required this.dateTime});

  Future<DateTime?> setDateText(
      BuildContext context, TextEditingController controller) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 100),
    );

    if (date == null) return null; // pressed cancel

    dateTime = date;
    controller.text = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return null;
  }

  Future<DateTime?> setTimeText(BuildContext context,
      {required TextEditingController controller,
      required String hour,
      required String minute}) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
    );

    if (time == null) return null; // pressed cancel

    DateTime pickedDateTime = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      time.hour,
      time.minute,
    );

    if (pickedDateTime.difference(DateTime.now()).isNegative) {
      Fluttertoast.showToast(
          msg: "you can't select a time in the past.",
          toastLength: Toast.LENGTH_SHORT);
      return null;
    }

    dateTime = pickedDateTime;
    controller.text =
        '${dateTime.hour.toString().padLeft(2, '0')} : ${dateTime.minute.toString().padLeft(2, '0')}';
    return dateTime;
  }
}
