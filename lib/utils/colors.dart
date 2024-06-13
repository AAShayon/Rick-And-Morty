import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors{

  static const Color primaryColor=Color(0xff9DFE00);
  static const Color  secondaryColor=Color(0xff13D9E5);
  static  Color baseColorBlack=Color(0xff191D29);
  static const Color baseColorWhite=Color(0xffffffff);
  static const Color baseColorGray=Color(0xffE3E3E3);
  static const LinearGradient linearGradient=LinearGradient(colors: [
    Color(0xff9DFE00),Color(0xff14D9E5),],
    stops: [0.7, 0.7],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}