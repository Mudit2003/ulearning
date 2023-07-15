import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // padding: EdgeInsets.only(bottom: 20.h),
          margin: EdgeInsets.only(top: 10.h, bottom: 15.h),
          width: 280.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.circular(15.h),
              border: Border.all(
                color: AppColors.primaryFourthElementText,
              )),
          child: Row(
            children: [
              SizedBox(
                width: 30.w,
                height: 16.w,
                child: Image.asset(("assets/icons/search.png")),
              ),
              SizedBox(
                width: 240.w,
                height: 40.h,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    hintText: "search your course",
                    hintStyle:
                        TextStyle(color: AppColors.primaryThirdElementText),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                    focusedBorder: OutlineInputBorder(
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
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
            ),
            child: Image.asset('assets/icons/options.png'),
          ),
        )
      ],
    );
  }
}
