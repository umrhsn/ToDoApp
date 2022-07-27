import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String label;
  final String hintText;
  final IconData? suffixIcon;
  void Function()? suffixIconOnTap;
  void Function(TapDownDetails)? suffixIconOnTapDown;
  final void Function()? onEditingComplete;

  TextFormFieldWidget({
    Key? key,
    this.readOnly = true,
    required this.controller,
    required this.label,
    required this.hintText,
    this.suffixIcon = Icons.keyboard_arrow_down_rounded,
    this.suffixIconOnTap,
    this.suffixIconOnTapDown,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          enabled: true,
          readOnly: readOnly,
          controller: controller,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: GestureDetector(
                  onTapDown: suffixIconOnTapDown,
                  onTap: suffixIconOnTap,
                  child: Icon(suffixIcon))),
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }
}
