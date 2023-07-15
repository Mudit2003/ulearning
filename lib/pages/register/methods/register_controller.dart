import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController(this.context);

  Future<void> handleEmailRegistration() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (username.isEmpty) {
      toastInfo(msg: "Username cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email name cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Empty Password nto allowed");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Wrong password confirmation");
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(username);
        toastInfo(
            msg:
                "An email has been sent to your registered email. To activate please click on the activation link");
        Navigator.of(context).pop(); // not a good practice
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
        return;
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "Email already in use");
        return;
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Invalid Email Field");
        return;
      }
    }
  }
}
