import 'package:flutter/material.dart';

class FavoriteTabBarView extends StatefulWidget {
  const FavoriteTabBarView({Key? key}) : super(key: key);

  @override
  State<FavoriteTabBarView> createState() => _FavoriteTabBarViewState();
}

class _FavoriteTabBarViewState extends State<FavoriteTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Favorite'));
  }
}
