import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25.w),
      width: 260.w,
      height: 44.h,
      child: GestureDetector(
        onTap: () {},
        child: Text("Forgot Password",
            style: TextStyle(
              color: AppColors.primaryText,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryText,
              fontSize: 12.sp,
            )),
      ),
    );
  }
}
