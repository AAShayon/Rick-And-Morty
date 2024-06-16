import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:ricky_morty/Modules/character/view/character_screen.dart';
import 'package:ricky_morty/Modules/character/viewModel/character_view_model.dart';
import 'package:ricky_morty/utils/colors.dart';
import 'package:ricky_morty/view/landing_page.dart';
import 'package:ricky_morty/view/splash_screen.dart';
import 'package:ricky_morty/viewModel/landing_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor,),);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return ScreenUtilInit(
      designSize: Size(430 ,932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create:(context)=>LandingViewModel()),
          ChangeNotifierProvider(create:(context)=>CharacterViewModel()),
        ],
        child: StreamProvider<InternetConnectionStatus>(
          initialData: InternetConnectionStatus.connected,
          create: (_) {
            return InternetConnectionChecker().onStatusChange;
          },child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Rick And Morty',
            theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              scaffoldBackgroundColor:  AppColors.baseColorBlack,
            ),
            home:const SplashScreen(),
          ),
        ),
      ),
    );
  }
}


