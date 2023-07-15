import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/homepage/homepage.dart';
import 'package:ulearning_app/pages/profile/profile.dart';

Widget buildApplicationPage(int index) {
  final List<Widget> widget = [
    const HomePage(),
    const Center(child: Text("Search")),
    const Center(child: Text("Course")),
    const Center(child: Text("Chat")),
    const ProfilePage(),
  ];
  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
      label: 'Home',
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/home.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/home.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
    label: 'Search',
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/search2.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Course',
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Chat',
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Profile',
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/person2.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];
