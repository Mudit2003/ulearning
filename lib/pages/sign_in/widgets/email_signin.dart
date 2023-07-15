import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/common/widgets/reusable_text.dart';
import 'package:ulearning_app/common/widgets/generic_textfield.dart';

class EmailSignIn extends StatelessWidget {
  const EmailSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36.h),
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const ReusableText(text: "Email"),
            GenericTextfield(
              textType: "email",
              hintText: "Enter your email address",
              iconName: "user",
              onChange: (value) {
                context.read<SignInBloc>().add(SignInEventEmail(email: value));
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
                    .read<SignInBloc>()
                    .add(SignInEventPassword(password: value));
              },
            ),
          ]),
    );
  }
}
