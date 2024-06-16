import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/utils/colors.dart';
import 'package:rick_morty/utils/styles.dart';
import 'package:rick_morty/view/landing_page.dart';
import 'package:rick_morty/view/widgets/fade_in_animation.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LandingScreen(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          image: DecorationImage(
            image: AssetImage('assets/splash/splashscreenbackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(height: 258.h,),
              Center(child: Image.asset('assets/splash/splashscreen.png')),
              SizedBox(height: 150.h,),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(.4) ),
                backgroundColor: Colors.transparent.withOpacity(.1),
              ),
                 SizedBox(height: 10.h),
              Text('Loading', style: TextStyles.caption1Strong(AppColors.baseColorBlack)),
            ],
          ),
        ),
      ),
    );
  }
}
