import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/values/constants.dart';
import 'package:ulearning_app/common/widgets/reusable_text.dart';

AppBar buildHomePageAppBar(String avatar) {
  print(avatar);
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.h,
              height: 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // server api url shall generally be your domain name
                  image: NetworkImage('${AppConstants.serverApiUrl}$avatar'),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

// Widget slidersView() {
//   return Column(
//     children: [
//       SizedBox(
//         width: 325.w,
//         height: 160.h,
//         child: PageView(
//           children: [
//             sliderContainer(path: 'assets/icons/art.png'),
//             sliderContainer(path: 'assets/icons/art.png'),
//             sliderContainer(path: 'assets/icons/art.png'),
//           ],
//         ),
//       ),
//     ],
//   );
// }

Widget sliderContainer({String path = 'assets/icons/art.png'}) => Container(
      width: 325.w,
      height: 160.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.h)),
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
    );

Widget reusableMenuButtonText(String menuText,
        {Color fillColor = AppColors.primaryBackground,
        Color textColor = AppColors.primaryThirdElementText}) =>
    Container(
      margin: EdgeInsets.only(top: 10.h, right: 20.w),
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
      decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(7.w),
          border: Border.all(
            color: fillColor,
          )),
      child: ReusableText(
        text: "All",
        color: textColor,
        fontSize: 11,
      ),
    );
