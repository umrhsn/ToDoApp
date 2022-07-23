import 'package:flutter/material.dart';

class UncompletedTabBarView extends StatefulWidget {
  const UncompletedTabBarView({Key? key}) : super(key: key);

  @override
  State<UncompletedTabBarView> createState() => _UncompletedTabBarViewState();
}

class _UncompletedTabBarViewState extends State<UncompletedTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Uncompleted'));
  }
}
