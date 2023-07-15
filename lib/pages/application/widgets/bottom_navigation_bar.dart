import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 58.h,
      decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.h),
            topRight: Radius.circular(20.h),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1)
          ]),
      child: BottomNavigationBar(
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primaryElement,
          unselectedItemColor: AppColors.primaryFourthElementText,
          onTap: (value) {
            context.read<AppBloc>().add(AppEventTrigger(index: value));
          },
          elevation: 0.h,
          items: bottomTabs),
    );
  }
}
