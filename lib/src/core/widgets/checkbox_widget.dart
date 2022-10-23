import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxWidget extends StatefulWidget {
  bool isChecked;
  bool isCircular;
  final void Function(bool?)? onChanged;
  final Color? activeColor;
  final Color borderColor;

  CheckboxWidget({
    Key? key,
    this.isChecked = false,
    this.isCircular = false,
    this.onChanged,
    required this.borderColor,
    this.activeColor,
  }) : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      // to control checkbox size
      scale: 1.h,
      child: Checkbox(
        value: widget.isChecked,
        activeColor: widget.activeColor,
        onChanged: widget.onChanged,
        shape: widget.isCircular
            ? const CircleBorder()
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(width: 1.0, color: widget.borderColor),
        ),
      ),
    );
  }
}
