import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // Assuming you are using flutter_screenutil for responsive design

class CustomImageFrame extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsets? padding;
  final Widget? child;

  const CustomImageFrame({
    super.key,
    this.height = 180.84,
    this.width = 177.18,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logo/Box.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
