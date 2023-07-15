import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/common/widgets/reusable_text.dart';
import 'package:ulearning_app/common/widgets/generic_textfield.dart';

class EmailRegistration extends StatelessWidget {
  const EmailRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.h),
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const ReusableText(text: "Username"),
            GenericTextfield(
              textType: "User name",
              hintText: "Enter your user name",
              iconName: "user",
              onChange: (value) {
                context
                    .read<RegisterBloc>()
                    .add(RegisterEventUserName(username: value));
              },
            ),
            SizedBox(height: 5.h),
            const ReusableText(text: "Email"),
            GenericTextfield(
              textType: "email",
              hintText: "Enter your email address",
              iconName: "user",
              onChange: (value) {
                context
                    .read<RegisterBloc>()
                    .add(RegisterEventEmail(email: value));
              },
            ),
            SizedBox(height: 5.h),
            const ReusableText(text: "Password"),
            SizedBox(height: 5.h),
            GenericTextfield(
              textType: "password",
              hintText: "Enter your password",
              iconName: "lock",
              onChange: (value) {
                context
                    .read<RegisterBloc>()
                    .add(RegisterEventPassword(password: value));
              },
            ),
            SizedBox(height: 5.h),
            const ReusableText(text: "Confirm Password"),
            SizedBox(height: 5.h),
            GenericTextfield(
              textType: "password",
              hintText: "Confirm your password",
              iconName: "lock",
              onChange: (value) {
                context
                    .read<RegisterBloc>()
                    .add(RegisterEventConfirmPassword(rePassword: value));
              },
            ),
          ]),
    );
  }
}
