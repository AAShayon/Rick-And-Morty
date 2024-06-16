
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:ricky_morty/utils/colors.dart';
import 'package:ricky_morty/utils/styles.dart';
import 'package:ricky_morty/view/widgets/reusable_image_form.dart';
import 'package:ricky_morty/viewModel/landing_view_model.dart';
class NoSelectWidget extends StatelessWidget {
  const NoSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.baseColorBlack.withOpacity(0.30),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,color: AppColors.baseColorWhite,),
          onPressed: () {
            final landingViewModel=Provider.of<LandingViewModel>(context,listen: false);
            landingViewModel.goBackToPreviousIndex();
            // landingViewModel.deselectCharacter();
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: [
          Center(child: Image.asset('assets/logo/applogo.png', fit: BoxFit.fill,))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageFrame(
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
              child: Container(
                height: 131.97.h,width: 157.63,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Lottie.asset('assets/screenicon/internet.json',
                  fit: BoxFit.fill,
                ),
              ) ,
            ),
          ),
          Center(
            child: Text(
              'No Select Character',
              style: TextStyles.caption1Strong(AppColors.baseColorGray),
            ),
          ),
        ],
      ),
    );
  }

}