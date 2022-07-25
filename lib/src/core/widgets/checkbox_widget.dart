import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    Key? key,
    required this.isChecked,
    required this.isCircular,
    required this.onChanged,
    required this.borderColor,
    this.activeColor,
  }) : super(key: key);

  final bool isChecked;
  final bool isCircular;
  final void Function(bool?)? onChanged;
  final Color? activeColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      // to control checkbox size
      scale: 1.h,
      child: Checkbox(
        value: isChecked,
        activeColor: activeColor,
        onChanged: onChanged,
        shape: isCircular
            ? const CircleBorder()
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(width: 1.0, color: borderColor),
        ),
      ),
    );
  }
}
