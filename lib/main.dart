import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ricky_monty/Modules/character/view/character_screen.dart';
import 'package:ricky_monty/Modules/character/viewModel/character_view_model.dart';
import 'package:ricky_monty/utils/colors.dart';
import 'package:ricky_monty/view/landing_page.dart';
import 'package:ricky_monty/view/splash_screen.dart';
import 'package:ricky_monty/viewModel/landing_view_model.dart';

void main() {
  // await WidgetsBinding.instance.initInstances();
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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick And Morty',
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor:  AppColors.baseColorBlack,
          ),
          home:const SplashScreen(),
        ),
      ),
    );
  }
}


