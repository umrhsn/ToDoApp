import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';
import 'package:to_do_app/src/core/widgets/checkbox_widget.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppColors.tasksColorsList.shuffle();
    bool isChecked = false;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding:
              const EdgeInsets.only(top: 17, left: 17, bottom: 17, right: 10),
          color: AppColors.tasksColorsList.first,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('09:00 AM',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp)),
                  Text('Design team meeting',
                      style: TextStyle(color: Colors.white, fontSize: 13.sp))
                ],
              ),
              CheckboxWidget(
                isChecked: isChecked,
                isCircular: true,
                onChanged: (_) {},
                activeColor: AppColors.tasksColorsList.first,
                borderColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
