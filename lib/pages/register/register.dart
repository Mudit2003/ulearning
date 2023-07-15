import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/methods/register_controller.dart';
import 'package:ulearning_app/common/widgets/appbar.dart';
import 'package:ulearning_app/common/widgets/auth_button.dart';
import 'package:ulearning_app/pages/register/widgets/email_reg.dart';
import 'package:ulearning_app/common/widgets/reusable_text.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          // padding: EdgeInsets.only(left: 20.w),
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Register"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20.h),
                    const Center(
                        child: ReusableText(
                            text: "Enter your detatils below & free sign up")),
                    const EmailRegistration(),
                    Container(
                      padding: EdgeInsets.only(left: 20.h),
                      height: 25.h,
                      child: const ReusableText(
                        text:
                            "By Signing Up you are agreeing to our terms and conditions",
                      ),
                    ),
                    AuthButton(
                      buttonType: "SignUp",
                      onTap: () {
                        RegisterController(context).handleEmailRegistration();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
