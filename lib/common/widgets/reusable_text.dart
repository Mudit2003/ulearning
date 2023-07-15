import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

class ReusableText extends StatelessWidget {
  const ReusableText(
      {super.key,
      required this.text,
      this.color = AppColors.primaryFourthElementText,
      this.fontSize = 14});
  final String text;
  final Color color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 5.h,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontWeight: FontWeight.normal,
            fontSize: fontSize.sp,
            overflow: TextOverflow.visible),
      ),
    );
  }
}
