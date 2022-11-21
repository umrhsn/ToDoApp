import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final void Function()? onTap;
  final void Function(TapDownDetails)? suffixIconOnTapDown;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;


  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.readOnly = true,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.suffixIcon = Icons.keyboard_arrow_down_rounded,
    this.onTap,
    this.suffixIconOnTapDown,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
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
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(suffixIcon),
                  ))),
          onEditingComplete: onEditingComplete,
          onTap: onTap,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
