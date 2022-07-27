import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/db_cubit.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';
import 'package:to_do_app/src/core/utils/app_constants.dart';
import 'package:to_do_app/src/core/widgets/checkbox_widget.dart';
import 'package:to_do_app/src/features/board/presentation/cubit/board_cubit.dart';

class BoardItem extends StatefulWidget {
  int index;

  BoardItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<BoardItem> createState() => _BoardItemState();
}

class _BoardItemState extends State<BoardItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: AppColors.tasksColorsList.shuffle();
    int isCompleted =
        DatabaseCubit.get(context).tasks[widget.index]['isCompleted'];

    void _handleClick(String value) {
      switch (value) {
        case 'Add to favorites':
          break;
      }
    }

    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isCompleted == 1 ? isCompleted = 0 : isCompleted = 1;
            });
            debugPrint('$isCompleted');
          },
          child: CheckboxWidget(
            isChecked: isCompleted == 1 ? true : false,
            onChanged: (_) {},
            activeColor: AppColors.tasksColorsList[0],
            borderColor: AppColors.tasksColorsList[0],
          ),
        ),
        SizedBox(width: 10.w),
        Text(DatabaseCubit.get(context).tasks[widget.index]['title']),
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
