import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';
import 'package:to_do_app/src/core/utils/app_constants.dart';
import 'package:to_do_app/src/core/widgets/checkbox_widget.dart';

class BoardItem extends StatelessWidget {
  const BoardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors.tasksColorsList.shuffle();
    bool isChecked = false;

    void _handleClick(String value) {
      switch (value) {
        case 'Add to favorites':
          break;
      }
    }

    return Row(
      children: [
        CheckboxWidget(
          isChecked: isChecked,
          isCircular: false,
          onChanged: (_) {},
          activeColor: AppColors.tasksColorsList[0],
          borderColor: AppColors.tasksColorsList[0],
        ),
        SizedBox(width: 10.w),
        const Text('Design team meeting'),
        const Spacer(),
        PopupMenuButton<String>(
          onSelected: _handleClick,
          itemBuilder: (context) {
            return AppConstants.boardMenuItems;
          },
        ),
      ],
    );
  }
}
