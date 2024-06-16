import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:ricky_morty/Modules/character/viewModel/character_view_model.dart';
import 'package:ricky_morty/utils/colors.dart';
import 'package:ricky_morty/utils/styles.dart';
import 'package:ricky_morty/view/widgets/no_internet_widget.dart';
import 'package:ricky_morty/view/widgets/reusable_image_form.dart';
import 'package:ricky_morty/viewModel/landing_view_model.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final characterViewModel=Provider.of<CharacterViewModel>(context,listen: false);
      characterViewModel.resetPage();
      characterViewModel.clearList();
      final page=characterViewModel.page;
      _loadData(context,page: page.toString(), isRefresh: true,isLoadMore: false);
      scrollController.addListener(_scrollListener);
    });
  }
  Future<void> _loadData(BuildContext context, {dynamic page, dynamic limit,required bool isRefresh,required bool isLoadMore}) async {
    final characterViewModel=Provider.of<CharacterViewModel>(context,listen: false);
   await  characterViewModel.characterListFetch(context,page: page.toString(),isLoadMore: isLoadMore);

  }
  void _scrollListener() {
    final characterViewModel=Provider.of<CharacterViewModel>(context,listen: false);
    final isLoading = characterViewModel.isLoadingState;
    if (!isLoading && scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      characterViewModel.pageCounter(context: context);
      final page = characterViewModel.page;
      _loadData(context, page: page.toString(),isRefresh: false,isLoadMore: true);
      if (kDebugMode) {
        print('Scrolling');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(
      builder: (context,characterViewModel,child) {
        return RefreshIndicator(
          color: AppColors.primaryColor,
          onRefresh: () async {
            setState(() {
              characterViewModel.resetPage();
              characterViewModel.clearList();
            });
            await _loadData(context, page: 1,isRefresh: true,isLoadMore: false);
            return Future<void>.delayed(const Duration(seconds: 2));
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar:AppBar(
              backgroundColor: AppColors.baseColorBlack.withOpacity(0.30),
              automaticallyImplyLeading: false,
              actions: [
                Expanded(child: Center(child: Image.asset('assets/logo/applogo.png', fit: BoxFit.fill,)))
              ],
            ),
            body:Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
                ? NoInternetWidget(
              onPressed: () {
                setState(() {
                  characterViewModel.resetPage();
                  characterViewModel.clearList();
                });
                _loadData(context, page: 1, limit: 10,isRefresh: false, isLoadMore: false);
              },
            ):
            SafeArea(
              child: characterViewModel.newCharacter!=null?
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo/backgroundImage.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color:AppColors.baseColorBlack.withOpacity(.6),

                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:24.w ),
                    child: ListView(

                      controller: scrollController,
                      children:  [
                        SizedBox(height: 24.h,),
                        Text(
                          'All Cast',
                          style: TextStyles.title2(AppColors.secondaryColor),
                        ),
                        SizedBox(height: 16.h),
                        GridView.builder(
                          // controller: scrollController,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 20.h,
                            childAspectRatio: .95,
                          ),
                          itemCount: characterViewModel.character.length,
                          itemBuilder: (context, index) {
                            return
                              InkWell(
                                onTap: () async {
                                final landingProvider=Provider.of<LandingViewModel>(context,listen: false);
                                  final character = characterViewModel.character![index];
                                  landingProvider.selectCharacter(character);
                                  characterViewModel.getCharacterEpisodes(context, character);
                                },
                                child: CustomImageFrame(
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 131.97.h,width: 157.63,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Image.network('${characterViewModel.character![index].image}',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        Expanded(
                                          child: Text('${characterViewModel.character![index].name}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                          },
                        ),
                        characterViewModel.isLoadMoreState == false
                            ? const SizedBox.shrink()
                            : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircularProgressIndicator(color: AppColors.primaryColor,),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'Loading more......',
                                style: TextStyle(
                                    color: AppColors.baseColorWhite,
                                    fontSize: 18.sp),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
         ],
                      ):const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
            ),
                  ),
        );
      }
    );


  }
}