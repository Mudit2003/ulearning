import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.buttonType,
    required this.onTap,
  });
  final String buttonType;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 325.w,
        height: 50.h,
        margin: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
          // check for the button  type
          top: buttonType == 'Register' ? 20.h : 40.h,
        ),
        decoration: BoxDecoration(
            // if login button blue color else white
            color: buttonType == 'Register'
                ? AppColors.primaryBackground
                : AppColors.primaryElement,
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                  color: Colors.grey.withOpacity(0.1))
            ],
            border: Border.all(
                // if login button no border else border
                color: buttonType == 'Login'
                    ? Colors.transparent
                    : AppColors.primaryFourthElementText)),
        child: Center(
            child: Text(
          buttonType,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              // if register buttton text is black else white
              color: buttonType == 'Register'
                  ? AppColors.primaryText
                  : AppColors.primaryBackground),
        )),
      ),
    );
  }
}
