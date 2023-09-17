import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

class GenericTextfield extends StatelessWidget {
  const GenericTextfield(
      {super.key,
      required this.textType,
      required this.iconName,
      required this.hintText,
      required this.onChange});
  final String textType;
  final String iconName;
  final String hintText;
  final void Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20.h),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
            border: Border.all(
              color: AppColors.primaryFourthElementText,
            )),
        child: Row(
          children: [
            Container(
              width: 16.w,
              height: 16.w,
              margin: EdgeInsets.only(left: 17.w),
              child: Image.asset("assets/icons/$iconName.png"),
            ),
            Container(
              width: 270.w,
              padding: EdgeInsets.only(top: 10.h),
              child: TextField(
                onChanged: onChange,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle:
                      const TextStyle(color: AppColors.primaryThirdElementText),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
                autocorrect: false,
                obscureText: textType == "password",
              ),
            ),
          ],
        ));
  }
}
