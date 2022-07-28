import 'package:flutter/material.dart';
import 'package:to_do_app/db_cubit.dart';
import 'package:to_do_app/src/features/board/presentation/widgets/tab_view_widget.dart';

class FavoriteTabBarView extends StatefulWidget {
  const FavoriteTabBarView({Key? key}) : super(key: key);

  @override
  State<FavoriteTabBarView> createState() => _FavoriteTabBarViewState();
}

class _FavoriteTabBarViewState extends State<FavoriteTabBarView> {
  @override
  void initState() {
    super.initState();
    DatabaseCubit.get(context).getFavoriteTasks();
  }

  @override
  Widget build(BuildContext context) {
    return const TabViewWidget();
  }
}
