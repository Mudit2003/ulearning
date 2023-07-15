import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

AppBar buildAppBar(final String title) => AppBar(
      // scrolledUnderElevation: 2.h,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1.0,
        ),
      ),
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
