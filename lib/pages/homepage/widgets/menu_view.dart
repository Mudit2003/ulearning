import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/reusable_bold_text.dart';
import 'package:ulearning_app/pages/homepage/widgets/home_page_widgets.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 325.w,
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BoldText(text: "Choose you course"),
              GestureDetector(
                child: const BoldText(
                  text: "See all",
                  color: AppColors.primaryThirdElementText,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            reusableMenuButtonText("All",
                fillColor: AppColors.primaryElement,
                textColor: AppColors.primaryElementText),
            reusableMenuButtonText("Popular"),
            reusableMenuButtonText("Newest"),
          ],
        )
      ],
    );
  }
}
