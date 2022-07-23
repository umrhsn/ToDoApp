import 'package:flutter/material.dart';
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
    return const BoardContent();
  }

  final appBar = AppBarWidget(
      title: AppStrings.boardScreenTitle,
      hasActions: true,
      trailingIcon: Icons.calendar_month_outlined,
      bottom: const TabBar(
        tabs: [
          Tab(text: 'All'),
          Tab(text: 'Completed'),
          Tab(text: 'Uncompleted'),
          Tab(text: 'Favorite'),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: appBar,
        body: _buildBodyContent(),
      ),
    );
  }
}
