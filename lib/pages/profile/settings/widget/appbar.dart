import 'package:flutter/material.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/reusable_bold_text.dart';

AppBar buildSettingsAppBar() {
  return AppBar(
    title: Container(
      child:const BoldText(text: "Settings")
    ),
  );
}
