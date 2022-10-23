import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    bool isChecked = BoardCubit.get(context).isChecked;
    int isCompleted = DatabaseCubit.get(context).tasks[widget.index]['isCompleted'];

    void handleClick(String value) {
      switch (value) {
        case 'Add to Completed':
          break;
      }
    }

    return Row(
      children: [
        BlocBuilder<BoardCubit, int>(
          builder: (context, state) {
            return CheckboxWidget(
              isChecked: isCompleted == 1 ? true : false,
              onChanged: (_) {
                BoardCubit.get(context).changeCheckState();
                isChecked ? isCompleted = 1 : isCompleted = 0;
                debugPrint('isCompleted = $isCompleted');
                DatabaseCubit.get(context).updateTaskCompletionState(
                  id: widget.index + 1,
                  isCompleted: isCompleted,
                );
                debugPrint('isCompleted = $isCompleted');
              },
              activeColor: AppColors.tasksColorsList[0],
              borderColor: AppColors.tasksColorsList[0],
            );
          },
        ),
        SizedBox(width: 10.w),
        Text(DatabaseCubit.get(context).tasks[widget.index]['title']),
        const Spacer(),
        PopupMenuButton<String>(
          onSelected: handleClick,
          itemBuilder: (context) {
            return AppConstants.boardMenuItems;
          },
        ),
      ],
    );
  }
}
