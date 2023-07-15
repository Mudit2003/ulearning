import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/reusable_bold_text.dart';

class ProfileListView extends StatelessWidget {
  ProfileListView({super.key});
  final imagesInfo = <String, String>{
    "settings": "settings.png",
    "Payment details": "credit-card.png",
    'Achievement': "award.png",
    'Love': 'heart(1).png',
    'Reminders': 'cube.png',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25.w),
      child: Column(
        children: [
          ...List.generate(
              imagesInfo.length,
              (index) => GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(AppRoutes.settingsPage),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      child: Row(
                        children: [
                          Container(
                            width: 40.w,
                            height: 40.h,
                            padding: const EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              color: AppColors.primaryElement,
                            ),
                            child: Image.asset(
                                "assets/icons/${imagesInfo.values.elementAt(index)}"),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          BoldText(text: imagesInfo.keys.elementAt(index))
                        ],
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
