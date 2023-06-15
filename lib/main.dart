import 'package:flutter/material.dart';
import 'package:united102/src/config/themes/white_theme.dart';
import 'package:united102/src/presentation/view/screens/document_list_screen.dart';
import 'package:united102/src/presentation/view/screens/location_select_screen.dart';
import 'package:united102/src/presentation/view/screens/main_screen.dart';
import 'package:united102/src/presentation/view/screens/service_description_screen.dart';
import 'package:united102/src/presentation/view/screens/service_point_screen.dart';
import 'package:united102/src/presentation/view/screens/service_select_screen.dart';
import 'package:united102/src/presentation/view/screens/theme_select_screen.dart';
import 'src/presentation/view/screens/language_select_screen.dart';



void main(){
  runApp(const  MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: whiteTheme,
      debugShowCheckedModeBanner: false,
home: ServiceSelectScreen(),
     routes: {
 '/ServiceDescriptionScreen': (context) => ServiceDescriptionScreen(),
      '/language_select': (context) => LanguageSelectScreen(),
       '/theme_select':(context)=> ThemeSelectScreen(),
       '/location_select': (context) => LocationSelectScreen(),
       '/service_point':(context)=> ServicePointScreen(),
       '/DocumentListScreen' :(context) => DocumentListScreen()
     },
    );
  }
}