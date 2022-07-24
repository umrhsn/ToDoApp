import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/core/utils/app_strings.dart';
import 'package:to_do_app/src/core/widgets/my_button_widget.dart';
import 'package:to_do_app/src/core/widgets/text_field_widget.dart';

class AddTaskContent extends StatelessWidget {
  const AddTaskContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final dateController = TextEditingController();
    final startTimeController = TextEditingController();
    final endTimeController = TextEditingController();
    final remindController = TextEditingController();
    final repeatController = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormFieldWidget(
                  enabled: true,
                  controller: titleController,
                  label: AppStrings.titleTextFormFieldLabel,
                  hintText: 'Design team meeting',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  controller: dateController,
                  label: AppStrings.dateTextFormFieldLabel,
                  hintText: '2021-02-28',
                  suffixIcon: Icons.keyboard_arrow_down_rounded,
                  suffixIconOnTap: () {},
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        controller: startTimeController,
                        label: AppStrings.startTimeTextFormFieldLabel,
                        hintText: '11:00 Am',
                        suffixIcon: Icons.access_time_rounded,
                        suffixIconOnTap: () {},
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormFieldWidget(
                        controller: endTimeController,
                        label: AppStrings.endTimeTextFormFieldLabel,
                        hintText: '14:00 Pm',
                        suffixIcon: Icons.access_time_rounded,
                        suffixIconOnTap: () {},
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  textInputAction: TextInputAction.next,
                  controller: remindController,
                  label: AppStrings.remindTextFormFieldLabel,
                  hintText: '10 minutes early',
                  suffixIcon: Icons.keyboard_arrow_down_rounded,
                  suffixIconOnTap: () {},
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  textInputAction: TextInputAction.done,
                  controller: repeatController,
                  label: AppStrings.repeatTextFormFieldLabel,
                  hintText: 'Weekly',
                  suffixIcon: Icons.keyboard_arrow_down_rounded,
                  suffixIconOnTap: () {},
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
          SizedBox(
              height: 116
                  .h), // FIXME: due to having a SingleChildScrollView, the Column's MainAxisAlignment.spaceBetween is ineffective, so temporarily I put SizedBox(height: 116.h)
          MyButtonWidget(
              onPressed: () {
                // TODO: implement creating a task function
              },
              label: AppStrings.createTaskButtonLabel),
        ],
      ),
    );
  }
}
