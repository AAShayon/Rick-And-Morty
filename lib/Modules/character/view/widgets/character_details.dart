import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ricky_monty/Modules/character/model/core/response_model/character_list_response_model.dart';
import 'package:ricky_monty/Modules/character/view/widgets/reusable_specification_container.dart';
import 'package:ricky_monty/utils/colors.dart';
import 'package:ricky_monty/utils/styles.dart';
import 'package:ricky_monty/view/widgets/blur_background.dart';
import 'package:ricky_monty/viewModel/landing_view_model.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Results results;

  CharacterDetailScreen({required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.baseColorBlack,
      appBar: AppBar(

        elevation: 4,
        backgroundColor: AppColors.baseColorBlack.withOpacity(0.30),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: AppColors.baseColorWhite,),
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
      body: SafeArea(
        child: BlurredBackgroundStack(
          backgroundImage:'assets/logo/backgroundImage.png' ,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 20.h,horizontal: 95.w),
                  child: Container(
                    height: 288.h,
                    width: 240.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${results.name}',
                          style: TextStyles.title2(AppColors.secondaryColor),
                        ),
                        SizedBox(height: 20.h,),
                        Container(
                          height: 240.h,width: 240.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.transparent,
                              border: Border.all(
                                  color: AppColors.secondaryColor.withOpacity(.1)
                              )
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 30.w),
                            child: Image.network("${results.image}"),
                          ),
                        ),
                    
                    
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    SpecificationCharacter(imagePath: 'assets/screenicon/status.png',title: 'Status',title2: '${results.status}', width: 116.67.w,height: 88.h,),
                    SpecificationCharacter(imagePath: 'assets/screenicon/species.png',title: 'Species',title2: '${results.species}',width: 116.67.w,height: 88.h,),
                    SpecificationCharacter(imagePath: 'assets/screenicon/gender.png',title: 'Gender',title2: '${results.gender}',width: 116.67.w,height: 88.h,)
                  ],),
                ),
                SizedBox(height:14.h,),
                Padding(padding: EdgeInsets.symmetric(horizontal:5.w),
                child: SpecificationCharacter(imagePath: 'assets/screenicon/origin.png', title: 'Origin', title2: '${results.origin!.name}', width: 382.w, height: 88.h),
                ),
                SizedBox(height:14.h,),
                Padding(padding: EdgeInsets.symmetric(horizontal:5.w),
                  child: SpecificationCharacter(imagePath: 'assets/screenicon/locations.png', title: 'Last Known Location', title2: '${results.location!.name}', width: 382.w, height: 88.h),
                ),
                SizedBox(height:14.h,),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 5.w),
          //   child: SpecificationCharacter(
          //     imagePath: 'assets/screenicon/episodes.png',
          //     title: 'Episode(s)',
          //     episodeList: results.episode!,
          //     width: 382.w,
          //   ),)
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}

