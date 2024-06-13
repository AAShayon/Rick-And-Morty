import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static const String fontFamily = 'PlusJakartaSans';

  static  TextStyle caption1Strong (Color? color) {
    return TextStyle(
  fontFamily: fontFamily,
  fontSize: 13.sp,
  height: 1.38, // Line-height divided by font-size
  fontWeight: FontWeight.w600,
      color: color
  );
}

  static  TextStyle body2 (Color? color) {
   return TextStyle(
      fontFamily: fontFamily,
      fontSize: 15.sp,
      height: 1.33, // Line-height divided by font-size
      fontWeight: FontWeight.w400,
     color: color
    );
  }

  static  TextStyle body2Strong (Color? color) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 15.sp,
      height: 1.33, // Line-height divided by font-size
      fontWeight: FontWeight.w600,
      color: color
    );
  }

  static  TextStyle body1 (Color? color) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 17.sp,
      height: 1.29, // Line-height divided by font-size
      fontWeight: FontWeight.w400,
      color: color
    );
  }

  static TextStyle body1Strong(Color? color) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 17.sp,
      height: 1.29, // Line-height divided by font-size
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
  static TextStyle title4(Color? color) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 10.sp,
      height: 1.8, // Line-height divided by font-size
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle title3(Color? color) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 20.sp,
      height: 1.25, // Line-height divided by font-size
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle title2(Color? color) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 22.sp,
      height: 1.27, // Line-height divided by font-size
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle title1(Color? color) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 28.sp,
      height: 1.21, // Line-height divided by font-size
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
}
