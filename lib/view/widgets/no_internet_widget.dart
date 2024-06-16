import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rick_morty/utils/colors.dart';
import 'package:rick_morty/utils/styles.dart';
import 'package:rick_morty/view/widgets/custom_circular_button.dart';

class NoInternetWidget extends StatelessWidget {
  final dynamic onPressed;
  NoInternetWidget({Key? key,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Container(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                      height: 120.h,
                      width: 120.w,
                      "assets/screenicon/internet.json",

                      fit: BoxFit.cover),

                  SizedBox(height: 30.h,),

                  Text("No internet !!!",style: TextStyles.body1Strong(AppColors.primaryColor),),
                  SizedBox(height: 5.h,),
                  Text("Please Check your internet connection",style: TextStyles.body1Strong(AppColors.primaryColor),),
                  SizedBox(height: 20.h,),

                  CustomCircularButton(text: 'Try Again', onPressed: onPressed)

                ],
              ),
            ],
          ))),
    );
  }
}