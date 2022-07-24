import 'package:flutter/material.dart';
import 'package:to_do_app/src/features/board/presentation/widgets/tab_view_widget.dart';

class CompletedTabBarView extends StatefulWidget {
  const CompletedTabBarView({Key? key}) : super(key: key);

  @override
  State<CompletedTabBarView> createState() => _CompletedTabBarViewState();
}

class _CompletedTabBarViewState extends State<CompletedTabBarView> {
  @override
  Widget build(BuildContext context) {
    return const MyTabView();
  }
}
