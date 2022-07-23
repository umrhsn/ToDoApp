import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/config/routes/app_routes.dart';
import 'package:to_do_app/src/core/utils/app_constants.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/core/widgets/app_bar_widget.dart';
import 'package:to_do_app/src/features/board/presentation/widgets/board_content.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  Widget _buildBodyContent() {
    return BoardContent();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarWidget(
      toolbarHeight: 80.h,
      title: AppStrings.boardScreenTitle,
      hasActions: true,
      trailingIcon: Icons.calendar_month_outlined,
      trailingIconOnTap: () =>
          Navigator.pushNamed(context, Routes.scheduleRoute),
      bottom: const TabBar(tabs: AppConstants.boardTabs),
    );

    return DefaultTabController(
      length: AppConstants.boardTabViews.length,
      child: Scaffold(
        appBar: appBar,
        body: _buildBodyContent(),
      ),
    );
  }
}
