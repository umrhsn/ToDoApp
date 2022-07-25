import 'package:flutter/material.dart';
import 'package:to_do_app/src/features/board/presentation/widgets/board_item.dart';

class TabViewWidget extends StatelessWidget {
  const TabViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => const BoardItem(), itemCount: 100);
  }
}