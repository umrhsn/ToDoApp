import 'package:flutter/material.dart';
import 'package:to_do_app/src/features/board/presentation/fragments/all_fragment.dart';
import 'package:to_do_app/src/features/board/presentation/fragments/completed_fragment.dart';
import 'package:to_do_app/src/features/board/presentation/fragments/favorite_fragment.dart';
import 'package:to_do_app/src/features/board/presentation/fragments/uncompleted_fragment.dart';

class BoardContent extends StatelessWidget {
  BoardContent({Key? key}) : super(key: key);

  final List<Widget> boardScreenFragments = [
    AllFragment(),
    CompletedFragment(),
    UncompletedFragment(),
    FavoriteFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: boardScreenFragments,
    );
  }
}
