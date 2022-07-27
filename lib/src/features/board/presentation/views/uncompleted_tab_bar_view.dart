import 'package:flutter/material.dart';
import 'package:to_do_app/src/features/board/presentation/widgets/tab_view_widget.dart';

class UncompletedTabBarView extends StatefulWidget {
  const UncompletedTabBarView({Key? key}) : super(key: key);

  @override
  State<UncompletedTabBarView> createState() => _UncompletedTabBarViewState();
}

class _UncompletedTabBarViewState extends State<UncompletedTabBarView> {
  @override
  Widget build(BuildContext context) {
    return const TabViewWidget();
  }
}
