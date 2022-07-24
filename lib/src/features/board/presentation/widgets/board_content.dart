import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/config/routes/app_routes.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';
import 'package:to_do_app/src/core/utils/app_constants.dart';
import 'package:to_do_app/src/core/widgets/my_button_widget.dart';

class BoardContent extends StatelessWidget {
  BoardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
      child: Column(
        children: [
          Expanded(
            child: TabBarView(children: AppConstants.boardTabViewsList),
          ),
          MyButtonWidget(
            label: 'Add a task',
            onPressed: () => Navigator.pushNamed(context, Routes.addTaskRoute),
          ),
        ],
      ),
    );
  }
}
