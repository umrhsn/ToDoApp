import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/src/core/utils/app_colors.dart';

class AllTabBarView extends StatefulWidget {
  const AllTabBarView({Key? key}) : super(key: key);

  @override
  State<AllTabBarView> createState() => _AllTabBarViewState();
}

class _AllTabBarViewState extends State<AllTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) => Text('item$index'),
              itemCount: 100),
        ),
        SizedBox(height: 15.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: MaterialButton(
            minWidth: double.infinity,
            padding: const EdgeInsets.all(20),
            onPressed: () {},
            color: AppColors.primary,
            textColor: Colors.white,
            elevation: 0,
            child: Text(
              'Add a task',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
