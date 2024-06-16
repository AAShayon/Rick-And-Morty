// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ricky_morty/utils/colors.dart';
// import 'package:ricky_morty/utils/styles.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class SpecificationCharacter extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String title2;
//   final double width;
//   final double? height;
//   final bool? iconButton;
//   final String? url;
//    const SpecificationCharacter({
//     super.key, required this.imagePath, required this.title, required this.title2,required this.width, this.height, this.iconButton, this.url,
//   });
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height!,
//       decoration: const BoxDecoration(
//           image: DecorationImage(image: AssetImage('assets/screenicon/commonReactangle.png',),fit: BoxFit.fill)
//       ),
//       child: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset(imagePath,width: 22.35.sp,height: 23.25.sp,),
//                 SizedBox(height: 7.h,),
//                 Text(title,style: TextStyles.title4(AppColors.baseColorWhite),),
//                 Text(title2,style: TextStyles.body1(AppColors.baseColorWhite),)
//               ],
//             ),
//             if (iconButton!)
//               IconButton(
//                 onPressed: () {
//                   launchUrl(Uri.parse(url!));
//                 },
//                 icon: Icon(Icons.open_in_new),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ricky_morty/utils/colors.dart';
import 'package:ricky_morty/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecificationCharacter extends StatelessWidget {
  final String imagePath;
  final String title;
  final String title2;
  final double width;
  final double? height;
  final bool? iconButton;
  final String? url;

  const SpecificationCharacter({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.title2,
    required this.width,
    this.height,
    this.iconButton,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height!,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/screenicon/commonReactangle.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(imagePath, width: 22.35.sp, height: 23.25.sp),
                SizedBox(height: 7.h),
                Text(
                  title,
                  style: TextStyles.title4(AppColors.baseColorWhite),
                ),
                Text(
                  title2,
                  style: TextStyles.body1(AppColors.baseColorWhite),
                ),
              ],
            ),
            if (iconButton ?? false)
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.only(left: 180.w,top: 30.h),
                  child: IconButton(
                    onPressed: () {
                      if (url != null) {
                        launchUrl(Uri.parse(url!));
                      }
                    },
                    icon: Icon(Icons.open_in_new,color: AppColors.baseColorWhite,size: 17.sp,),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

