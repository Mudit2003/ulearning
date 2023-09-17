import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning_app/common/apis/user_api.dart';
import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/values/constants.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    log('handle signing');
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        final String email = state.email;
        final String password = state.password;
        // print(email);
        // print(password);
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
          // print("user:${user.toString()}");
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid; // here an id is assigned
            String? photoUrl = user.photoURL;
            // print("Calling some printin Request Entity");
            LoginRequestEntity loginRequestEntity = LoginRequestEntity(
              avatar: photoUrl,
              name: displayName,
              email: email,
              // type 1 is email login
              type: 1,
              open_id: id, // open id is actually the user id
            );
            // print("Logging in user");
            await asyncPostAllData(loginRequestEntity);
            // print()
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil('/application/', (route) => false);
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
      print("Error:${e.toString()}");
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    // print('asycn post mein hoon');
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    // print("Trying to get the variable called result");
    UserLoginResponseEntity result =
        await UserAPI.login(param: loginRequestEntity);
    if (result.code == 200) {
      // code 200 is success
      try {
        Global.storageService.setString(
          AppConstants.storageUserProfileKey,
          jsonEncode(result
              .data!), // here you are storing result.data in json format in a mapping as user profile key
        );
        Global.storageService.setString(
          AppConstants.storageUserTokenKey,
          result.data!
              .access_token!, // as user token key you single out the access token from the whole data
        );
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/application/', (route) => false);
        EasyLoading.dismiss();
      } catch (e) {
        print('saving local storage error');
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: 'unknown error');
    }
  }
}
