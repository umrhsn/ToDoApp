import 'package:flutter/material.dart';

class UncompletedFragment extends StatefulWidget {
  const UncompletedFragment({Key? key}) : super(key: key);

  @override
  State<UncompletedFragment> createState() => _UncompletedFragmentState();
}

class _UncompletedFragmentState extends State<UncompletedFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Uncompleted'));
  }
}
