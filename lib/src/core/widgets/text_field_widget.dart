import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool? enabled;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String label;
  final String hintText;
  final IconData? suffixIcon;
  final void Function()? suffixIconOnTap;
  final void Function()? onEditingComplete;

  const TextFormFieldWidget({
    Key? key,
    this.enabled = false,
    required this.controller,
    required this.label,
    required this.hintText,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.focusNode,
    required this.keyboardType,
    this.onEditingComplete,
    required this.textInputAction,
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
          enabled: enabled,
          controller: controller,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon:
                  InkWell(onTap: suffixIconOnTap, child: Icon(suffixIcon))),
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }
}
