import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({super.key, required this.iconName});
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 50.w,
        height: 50.w,
        child: Image.asset("assets/icons/$iconName"),
      ),
    );
  }
}
