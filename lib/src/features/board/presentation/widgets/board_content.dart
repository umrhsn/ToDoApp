import 'package:flutter/material.dart';

class BoardContent extends StatelessWidget {
  const BoardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Center(child: Text('All')),
        Center(child: Text('Completed')),
        Center(child: Text('Uncompleted')),
        Center(child: Text('Favorite')),
      ],
    );
  }
}
