import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/values/constants.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        final String email = state.email;
        final String password = state.password;
        if (email.isEmpty) {
          toastInfo(msg: "Please fill your email");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Please fill your password");
          return;
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (credential.user == null) {
            toastInfo(msg: "No user");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'Email not verified');
          }
          var user = credential.user;
          log(user.toString());
          if (user != null) {
            Global.storageService
                .setString(AppConstants.storageUserTokenKey, '123456');
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/application/', (route) => false);
            toastInfo(msg: 'User exists');
          } else {
            toastInfo(msg: 'user does not exist');
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'User Not Found');
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong Password');
            return;
          } else if (e.code == 'invalid-email') {
            // this one should be handled using regex instead of firebase
            toastInfo(msg: 'Invalid Email');
            return;
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
