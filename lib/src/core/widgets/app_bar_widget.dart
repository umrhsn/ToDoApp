import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  bool hasLeadingIcon;
  final IconData? leadingIcon;
  void Function()? leadingIconOnTap;
  final String title;
  bool hasActions;
  final IconData? trailingIcon;
  void Function()? trailingIconOnTap;
  PreferredSizeWidget? bottom;
  double toolbarHeight;

  AppBarWidget({
    Key? key,
    required this.title,
    this.hasLeadingIcon = false,
    this.leadingIcon,
    this.leadingIconOnTap,
    this.hasActions = false,
    this.trailingIcon,
    this.trailingIconOnTap,
    this.bottom,
    this.toolbarHeight = 65,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasLeadingIcon
          ? InkWell(
              onTap: leadingIconOnTap,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(leadingIcon),
                ),
              ),
            )
          : null,
      title: Text(title),
      actions: hasActions
          ? [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: IconButton(
                  onPressed: trailingIconOnTap,
                  icon: Icon(trailingIcon),
                ),
              )
            ]
          : null,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
