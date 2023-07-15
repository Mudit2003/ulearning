import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

class BoldText extends StatelessWidget {
  const BoldText({
    super.key,
    required this.text,
    this.color = AppColors.primaryText,
    this.fontSize = 16,
  });
  final String text;
  final Color color;
  final int fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: fontSize.sp,
      ),
      maxLines: 1,
      overflow: TextOverflow.fade,
      softWrap: false,
      textAlign: TextAlign.left,
    );
  }
}
