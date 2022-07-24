import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';

class BoardItem extends StatelessWidget {
  const BoardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors.tasksColorsList.shuffle();
    bool isChecked = false;

    return Row(
      children: [
        Transform.scale(
          // to control checkbox size
          scale: 1.h,
          child: Checkbox(
            value: isChecked,
            activeColor: AppColors.tasksColorsList[0],
            onChanged: (_) {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: MaterialStateBorderSide.resolveWith(
              (states) =>
                  BorderSide(width: 1.0, color: AppColors.tasksColorsList[0]),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        const Text('Design team meeting'),
        const Spacer(),
        PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (context) {
              return {'Add to favorites'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            }),
      ],
    );
  }
}

void handleClick(String value) {
  switch (value) {
    case 'Add to favorites':
      break;
  }
}
