import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:ricky_morty/Modules/character/view/character_screen.dart';
import 'package:ricky_morty/Modules/character/view/widgets/character_details.dart';
import 'package:ricky_morty/utils/colors.dart';
import 'package:ricky_morty/utils/styles.dart';
import 'package:ricky_morty/view/widgets/no_widget.dart';
import 'package:ricky_morty/view/widgets/reusable_image_form.dart';
import 'package:ricky_morty/view/widgets/search_delegate.dart';
import 'package:ricky_morty/viewModel/landing_view_model.dart';
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LandingViewModel>(
      builder: (context, provider, child) {
        List<Widget> _screens = [
          CharacterListScreen(),
          provider.character != null
              ? CharacterDetailScreen(character:provider.character! ,)
              : NoSelectWidget(),
        ];


        return WillPopScope(
          onWillPop: () async {
            final landingViewModel = Provider.of<LandingViewModel>(context,listen: false);
            if (landingViewModel.currentIndex > 0) {
              landingViewModel.goBackToPreviousIndex();
              return false;
            }
            else {
              bool exit = await _showExitDialog(context);
              return exit;
            }
          },
          child: Scaffold(
              backgroundColor: AppColors.baseColorBlack,
              body: _screens[provider.currentIndex],
              bottomNavigationBar:BottomAppBar(
                color: AppColors.baseColorBlack,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: Column(
                        children: [
                          Icon(
                            Icons.home,
                            color: provider.currentIndex == 0 ? AppColors.primaryColor :  AppColors.baseColorWhite,
                          ),
                          Text('Home',style: TextStyle( fontFamily:  'PlusJakartaSans',
                              fontSize: 13.sp,
                              height: 1.38, // Line-height divided by font-size
                              fontWeight: FontWeight.w600,
                              color: provider.currentIndex == 0 ? AppColors.primaryColor :  AppColors.baseColorWhite),)
                        ],
                      ),
                      onTap: () {
                        provider.setCurrentIndex(0);
                      },
                    ),
                    InkWell(
                      onTap: (){
                        showSearch(context: context, delegate: SearchCharacter());
                      },
                      child: SizedBox(
                          width: 134.w,
                          child:Container(
                            // height: 5.h,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xffE0E0E0), width: 5
                                    )
                                )
                            ),
                          )
                      ),
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            color: provider.currentIndex == 1 ? AppColors.primaryColor :  AppColors.baseColorWhite,
                          ),
                          Text('Cast',style: TextStyle(fontFamily:  'PlusJakartaSans',
                            fontSize: 13.sp,
                            height: 1.38, // Line-height divided by font-size
                            fontWeight: FontWeight.w600,
                            color: provider.currentIndex == 1 ? AppColors.primaryColor :  AppColors.baseColorWhite,
                          )),
                        ],
                      ),
                      onTap: () {
                        provider.setCurrentIndex(1);
                      },
                    ),

                  ],
                ),
              )

          ),
        );
      },
    );
  }
  Future<bool> _showExitDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.baseColorBlack,
        title: Text('Exit App',style: TextStyle(color: AppColors.baseColorWhite)),
        content: Text('Are you sure you want to exit the app?',style: TextStyle(color: AppColors.baseColorWhite)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No',style: TextStyle(color: AppColors.baseColorWhite)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes',style: TextStyle(color: AppColors.baseColorWhite)),
          ),
        ],
      ),
    ) ?? false;
  }
}



