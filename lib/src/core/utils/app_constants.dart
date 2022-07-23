import 'package:flutter/material.dart';
import 'package:to_do_app/src/features/board/presentation/views/all_tab_bar_view.dart';
import 'package:to_do_app/src/features/board/presentation/views/completed_tab_bar_view.dart';
import 'package:to_do_app/src/features/board/presentation/views/uncompleted_tab_bar_view.dart';
import 'package:to_do_app/src/features/board/presentation/views/favorite_tab_bar_view.dart';

class AppConstants {
  static const List<Widget> boardTabs = [
    Tab(text: 'All'),
    Tab(text: 'Completed'),
    Tab(text: 'Uncompleted'),
    Tab(text: 'Favorite'),
  ];

  static const List<Widget> boardTabViews = [
    Padding(padding: EdgeInsets.all(20), child: AllTabBarView()),
    Padding(padding: EdgeInsets.all(20), child: CompletedTabBarView()),
    Padding(padding: EdgeInsets.all(20), child: UncompletedTabBarView()),
    Padding(padding: EdgeInsets.all(20), child: FavoriteTabBarView()),
  ];
}
