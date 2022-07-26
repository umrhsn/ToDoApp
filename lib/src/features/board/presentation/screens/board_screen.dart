import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/db_cubit.dart';
import 'package:to_do_app/db_state.dart';
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
    return BlocBuilder<DatabaseCubit, DatabaseState>(
      builder: (context, state) {
        return BoardContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarWidget(
      toolbarHeight: 100,
      title: AppStrings.boardScreenTitle,
      hasActions: true,
      trailingIcon: Icons.calendar_month_outlined,
      trailingIconOnTap: () =>
          Navigator.pushNamed(context, Routes.scheduleRoute),
      bottom: const TabBar(tabs: AppConstants.boardTabs, isScrollable: true),
    );

    return DefaultTabController(
      length: AppConstants.boardTabViewsList.length,
      child: Scaffold(
        appBar: appBar,
        body: _buildBodyContent(),
      ),
    );
  }
}
