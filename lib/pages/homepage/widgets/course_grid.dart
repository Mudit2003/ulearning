import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/reusable_bold_text.dart';
import 'package:ulearning_app/common/widgets/reusable_text.dart';

class CourseGrid extends StatelessWidget {
  const CourseGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/icons/Image(2).png')),
          borderRadius: BorderRadius.circular(15.w)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const BoldText(
            text: "Best Course for IT",
            color: AppColors.primaryElementText,
            fontSize: 11,
          ),
          SizedBox(height: 5.h),
          const ReusableText(
            text: "Flutter best course",
            color: AppColors.primaryFourthElementText,
            fontSize: 8,
          ),
        ],
      ),
    );
  }
}
