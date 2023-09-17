
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/methods/auth/sign_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/email_signin.dart';
import 'package:ulearning_app/common/widgets/appbar.dart';
import 'package:ulearning_app/pages/sign_in/widgets/forgot_password_button.dart';
import 'package:ulearning_app/pages/sign_in/widgets/third_party_signin.dart';
import 'package:ulearning_app/common/widgets/auth_button.dart';
import 'package:ulearning_app/common/widgets/reusable_text.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Login'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const ThirdPartyLogin(),
                    const Center(
                        child: ReusableText(
                            text: "Or User your email account to login")),
                    const EmailSignIn(),
                    const ForgotPasswordButton(),
                    SizedBox(
                      height: 70.h,
                    ),
                    AuthButton(
                      buttonType: "Login",
                      onTap: () {
                        print("Sign In on the go");
                        SignInController(context: context)
                            .handleSignIn('email');
                      },
                    ),
                    AuthButton(
                      buttonType: "Register",
                      onTap: () {
                        Navigator.of(context).pushNamed('/register/');
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
