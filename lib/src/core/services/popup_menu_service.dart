import 'package:flutter/material.dart';

class PopupMenuService {
  final BuildContext context;

  PopupMenuService(this.context);

  void showPopupMenuAtPosition(
      TapDownDetails details, List<PopupMenuItem> menuItems) {
    final position = details.globalPosition;
    _showPopupMenu(context, position, menuItems);
  }

  Future _showPopupMenu(BuildContext context, Offset offset,
      List<PopupMenuItem> menuItems) async {
    return await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
        items: menuItems);
  }
}
