import 'package:flutter/material.dart';
import 'package:united102/src/config/themes/white_theme.dart';
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
     initialRoute: '/location_select',
     routes: {
      '/': (context) => LanguageSelectScreen(),
       '/location_select':(context)=> LocationSelectScreen()
     },
    );
  }
}