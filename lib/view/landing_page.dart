import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ricky_monty/Modules/character/view/character_screen.dart';
import 'package:ricky_monty/Modules/character/view/widgets/character_details.dart';
import 'package:ricky_monty/utils/colors.dart';
import 'package:ricky_monty/utils/styles.dart';
import 'package:ricky_monty/viewModel/landing_view_model.dart';
class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LandingViewModel>(
      builder: (context, provider, child) {
        List<Widget> _screens = [
          CharacterListScreen(),
          provider.results != null
              ? CharacterDetailScreen(results:provider.results! ,)
              : Center(child: Text('Select a character to view details')),
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(
                    width: 134.w,
                    child: const TextField(
                      // onChanged: (value) {
                      //   provider.searchCharacters(value);
                      // },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE0E0E0), width: 5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE0E0E0), width: 5),
                        ),
                      ),
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

            // BottomNavigationBar(
            //   backgroundColor: AppColors.baseColorBlack,
            //   elevation: 0,
            //   currentIndex: provider.currentIndex,
            //   onTap: (index) {
            //     provider.setCurrentIndex(index);
            //   },
            //   items: const [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.home),
            //       label: 'Home',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.account_circle_outlined),
            //       label: 'Cast',
            //     ),
            //   ],
            // ),
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


class NoSelectWidget extends StatelessWidget {
  const NoSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: Text(
          'No Select Character',
          style: TextStyles.caption1Strong(AppColors.baseColorGray),
        ),
      ),
    );
  }

}
