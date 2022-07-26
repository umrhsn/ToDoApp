import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/config/routes/app_routes.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';
import 'package:to_do_app/src/core/utils/media_query_values.dart';

class MyButtonWidget extends StatelessWidget {
  final double minWidth;
  final void Function()? onPressed;
  final String label;

  const MyButtonWidget(
      {Key? key,
      this.minWidth = double.infinity,
      required this.onPressed,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLight = context.platformBrightness == Brightness.light;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        minWidth: minWidth,
        padding: const EdgeInsets.all(20),
        onPressed: onPressed,
        color: isLight ? AppColors.primaryLight : AppColors.primaryDark,
        textColor: Colors.white,
        elevation: 0,
        child: Text(
          label,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
