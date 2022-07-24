import 'package:flutter/material.dart';
import 'package:to_do_app/src/features/board/presentation/widgets/tab_view_widget.dart';

class AllTabBarView extends StatefulWidget {
  const AllTabBarView({Key? key}) : super(key: key);

  @override
  State<AllTabBarView> createState() => _AllTabBarViewState();
}

class _AllTabBarViewState extends State<AllTabBarView> {
  @override
  Widget build(BuildContext context) {
    return const MyTabView();
  }
}
