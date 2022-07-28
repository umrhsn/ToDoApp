import 'package:flutter/material.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';

class ColorPickerWidget extends StatefulWidget {
  // TODO: add more attributes and functionalities
  int selectedColor;

  ColorPickerWidget({Key? key, required this.selectedColor}) : super(key: key);

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Wrap(
          children: List<Widget>.generate(4, (index) {
            return GestureDetector(
              onTap: () => setState(() => widget.selectedColor = index),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? AppColors.tasksColorsList[0]
                      : index == 1
                      ? AppColors.tasksColorsList[1]
                      : index == 2
                      ? AppColors.tasksColorsList[2]
                      : AppColors.tasksColorsList[3],
                  child: widget.selectedColor == index
                      ? const Icon(Icons.done,
                      color: Colors.white, size: 16)
                      : Container(),
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
