import 'package:flutter/material.dart';

class CompletedFragment extends StatefulWidget {
  const CompletedFragment({Key? key}) : super(key: key);

  @override
  State<CompletedFragment> createState() => _CompletedFragmentState();
}

class _CompletedFragmentState extends State<CompletedFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Completed'));
  }
}
