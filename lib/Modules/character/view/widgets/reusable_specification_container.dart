import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ricky_monty/utils/colors.dart';
import 'package:ricky_monty/utils/styles.dart';

class SpecificationCharacter extends StatelessWidget {
  final String imagePath;
  final String title;
  final String title2;
  final double width;
  final double? height;
   const SpecificationCharacter({
    super.key, required this.imagePath, required this.title, required this.title2,required this.width, this.height,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height!,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/screenicon/commonReactangle.png',),fit: BoxFit.fill)
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(imagePath,width: 22.35.sp,height: 23.25.sp,),
            SizedBox(height: 7.h,),
            Text(title,style: TextStyles.title4(AppColors.baseColorWhite),),
            Text(title2,style: TextStyles.body1(AppColors.baseColorWhite),)
          ],
        ),
      ),
    );
  }
}
///
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ricky_monty/utils/colors.dart';
// import 'package:ricky_monty/utils/styles.dart';
//
// class SpecificationCharacter extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String? title2;
//   final List<String>? episodeList;
//   final double width;
//   final double? height;
//
//   const SpecificationCharacter({
//     Key? key,
//     required this.imagePath,
//     required this.title,
//     this.title2,
//     this.episodeList,
//     required this.width,
//     this.height,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height ?? (episodeList != null ? episodeList!.length * 30.h : 88.h),
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/screenicon/commonReactangle.png'),
//           fit: BoxFit.fill,
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(imagePath, width: 22.35.sp, height: 23.25.sp),
//             SizedBox(height: 7.h),
//             Text(title, style: TextStyles.title4(AppColors.baseColorWhite)),
//             if (title2 != null)
//               Text(title2!, style: TextStyles.body1(AppColors.baseColorWhite)),
//             if (episodeList != null)
//               ...episodeList!.map((episode) => Text(episode, style: TextStyles.body1(AppColors.baseColorWhite))),
//           ],
//         ),
//       ),
//     );
//   }
// }
