import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/Modules/character/model/core/response_model/character_list_response_model.dart';
import 'package:rick_morty/Modules/character/view/widgets/reusable_specification_container.dart';
import 'package:rick_morty/Modules/character/viewModel/character_view_model.dart';
import 'package:rick_morty/utils/colors.dart';
import 'package:rick_morty/utils/styles.dart';
import 'package:rick_morty/view/widgets/blur_background.dart';
import 'package:rick_morty/view/widgets/no_internet_widget.dart';
import 'package:rick_morty/viewModel/landing_view_model.dart';

class CharacterDetailScreen extends StatefulWidget {
  final Character character;

  CharacterDetailScreen({required this.character});

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData(context);
    });
  }

  Future<void> _loadData(BuildContext context) async {
    final characterViewModel = Provider.of<CharacterViewModel>(context, listen: false);
    await characterViewModel.getCharacterEpisodes(context, widget.character);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(
      builder: (context,characterViewModel,child) {
        final episodes=characterViewModel.episodes;
        return RefreshIndicator(
          onRefresh: () async {
            await _loadData(context);
            return Future<void>.delayed(const Duration(seconds: 2));
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppColors.baseColorBlack,
            appBar: AppBar(
              elevation: 4,
              backgroundColor: AppColors.baseColorBlack.withOpacity(0.30),
              automaticallyImplyLeading: true,
              leading:  InkWell(
                onTap: (){
                  final landingViewModel=Provider.of<LandingViewModel>(context,listen: false);
                  landingViewModel.goBackToPreviousIndex();
                  log("on tappinggggg");

                },
                child: Container(
                  child:Icon(Icons.arrow_back_ios_new,color: AppColors.baseColorWhite,),
                ),
              ),
              centerTitle: true,
              actions: [
                Expanded(child: Center(child: Image.asset('assets/logo/applogo.png', fit: BoxFit.fill,)))
              ],
            ),
            body:Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
                ? NoInternetWidget(
              onPressed: () {
                _loadData(context);
              },
            )
                :  SafeArea(
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
                              Expanded(
                                child: Text(
                                  '${widget.character.name}',
                                  style: TextStyles.title2(AppColors.secondaryColor),
                                ),
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
                                  child: Image.network("${widget.character.image}"),
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
                          SpecificationCharacter(imagePath: 'assets/screenicon/status.png',title: 'Status',title2: '${widget.character.status}', width: 116.67.w,height: 88.h,),
                          SpecificationCharacter(imagePath: 'assets/screenicon/species.png',title: 'Species',title2: '${widget.character.species}',width: 116.67.w,height: 88.h,),
                          SpecificationCharacter(imagePath: 'assets/screenicon/gender.png',title: 'Gender',title2: '${widget.character.gender}',width: 116.67.w,height: 88.h,)
                        ],),
                      ),
                      SizedBox(height:14.h,),
                      Padding(padding: EdgeInsets.symmetric(horizontal:5.w),
                      child: SpecificationCharacter(imagePath: 'assets/screenicon/origin.png', title: 'Origin', title2: '${widget.character.origin!.name}', width: 382.w, height: 88.h,iconButton: true,url: '${widget.character.origin!.url}',),

                      ),
                      SizedBox(height:14.h,),
                      Padding(padding: EdgeInsets.symmetric(horizontal:5.w),
                        child: SpecificationCharacter(imagePath: 'assets/screenicon/locations.png', title: 'Last Known Location', title2: '${widget.character.location!.name}', width: 382.w, height: 88.h,iconButton: true,url: '${widget.character.location!.url}',),
                      ),
                      SizedBox(height:14.h,),
                      episodes.isNotEmpty ?
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Container(
                          width: 382.w,
                          decoration:  BoxDecoration(
                              border: Border.all(color:AppColors.secondaryColor.withOpacity(.5),width: 1 ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:   Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('assets/screenicon/episodes.png',
                                  width: 22.35.sp,
                                  height: 23.25.sp,
                                ),
                                SizedBox(height: 7.h),
                                Text(
                                  'Episode(s)',
                                  style: TextStyles.title4(AppColors.baseColorWhite),
                                ),
                                SizedBox(height: 15.h,),
                                Padding(
                                  padding:  EdgeInsets.only(left: 10.w),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: episodes.length,
                                    itemBuilder: (context, index) {
                                      final episode = episodes[index];
                                      return Text('\u2022  ${episode.name!}',style: TextStyles.body1(AppColors.baseColorWhite));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ),
                      ):Column(
                        children: [
                          Text('Data Loading.............',style: TextStyles.body1Strong(AppColors.baseColorWhite),),
                           SizedBox(height: 10.h,),
                           Center(child: CircularProgressIndicator(color: AppColors.secondaryColor,)),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

