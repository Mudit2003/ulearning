import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/widgets/social_icon_buttons.dart';

class ThirdPartyLogin extends StatelessWidget {
  const ThirdPartyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40.h,
        bottom: 20.h,
      ),
      padding: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SocialIconButton(iconName: "google.png"),
          SocialIconButton(iconName: "apple.png"),
          SocialIconButton(iconName: "facebook.png"),
        ],
      ),
    );
  }
}
