import 'package:flutter/material.dart';

class CompletedTabBarView extends StatefulWidget {
  const CompletedTabBarView({Key? key}) : super(key: key);

  @override
  State<CompletedTabBarView> createState() => _CompletedTabBarViewState();
}

class _CompletedTabBarViewState extends State<CompletedTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Completed'));
  }
}
