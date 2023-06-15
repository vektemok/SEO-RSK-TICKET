import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:united102/src/config/themes/white_theme.dart';
import 'package:united102/src/presentation/view/screens/document_list_screen.dart';
import 'package:united102/src/presentation/view/screens/location_select_screen.dart';
import 'package:united102/src/presentation/view/screens/theme_select_screen.dart';
import 'features/splashScreen/presentation/screens/SplashScreen/splash_screen.dart';
import 'src/presentation/view/screens/language_select_screen.dart';


void main(){
  runApp(const  MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: whiteTheme,
          home: child,
           routes: {

      '/language_select': (context) => LanguageSelectScreen(),
       '/theme_select':(context)=> ThemeSelectScreen(),
       '/location_select': (context) => LocationSelectScreen(),
       '/service_point':(context)=> ServicePointScreen(),
       '/DocumentListScreen' :(context) => DocumentListScreen()
     },
        );
      },
      child:  SplashScreen(),
      
    );
  }
}