import 'package:flutter/material.dart';

class BoardContent extends StatelessWidget {
  const BoardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Text('All'),
        Text('Completed'),
        Text('Uncompleted'),
        Text('Favorite'),
      ],
    );
  }
}
