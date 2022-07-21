import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/features/board/presentation/widgets/board_content.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  Widget _buildBodyContent() {
    return const BoardContent();
  }

  final appBar = AppBar(title: const Text(AppStrings.appName));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: _buildBodyContent(),
    );
  }
}
