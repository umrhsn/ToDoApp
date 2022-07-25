import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/features/schedule/presentation/widgets/date_picker_widget.dart';
import 'package:to_do_app/src/features/schedule/presentation/widgets/schedule_item.dart';

class ScheduleContent extends StatefulWidget {
  const ScheduleContent({Key? key}) : super(key: key);

  @override
  State<ScheduleContent> createState() => _ScheduleContentState();
}

class _ScheduleContentState extends State<ScheduleContent> {
  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePickerWidget(
            startDate: DateTime.now(),
            selectedValue: _selectedValue,
            initialSelectedDate: DateTime.now()),
        const Divider(thickness: 2),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sunday',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.h),
              ),
              Text('28 Feb, 2021', style: TextStyle(fontSize: 12.h))
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 8),
            child: ListView.builder(
                itemBuilder: (context, index) => const ScheduleItem(),
                itemCount: 100),
          ),
        ),
      ],
    );
  }
}
