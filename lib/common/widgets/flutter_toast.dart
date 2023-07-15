import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
  Color backGroundColor = Colors.black,
  Color textColor = Colors.white,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: backGroundColor,
        textColor: textColor,
        fontSize: 16.sp);
