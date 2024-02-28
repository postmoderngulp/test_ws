import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ws/presentation/style/colors.dart';

abstract class FontStyle {
  static TextStyle titleMain = TextStyle(
      color: colors.main,
      fontSize: 24.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700);

  static TextStyle labelMain = TextStyle(
      color: colors.text4,
      fontSize: 16.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400);
  static TextStyle labelSignUp = TextStyle(
      color: colors.gray2,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400);
  static TextStyle labelSignUpMain = TextStyle(
      color: colors.main,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400);
  static TextStyle skip = TextStyle(
      color: colors.main,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700);
  static TextStyle next = TextStyle(
      color: Colors.white,
      fontSize: 14.sp,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700);
}
