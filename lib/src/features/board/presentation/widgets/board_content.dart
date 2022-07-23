import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_constants.dart';

class BoardContent extends StatelessWidget {
  BoardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: AppConstants.boardTabViews,
    );
  }
}
