import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

class HomePageText extends StatelessWidget {
  final String text;
  final Color color;
  final int top;
  const HomePageText({
    super.key,
    required this.text,
    this.color = AppColors.primaryText,
    this.top = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top.h),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
