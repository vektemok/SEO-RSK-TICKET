import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'language_select_screen.dart';



void main(){
  runApp(const  MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: '/',
     routes: {
      '/': (context) => LanguageSelectScreen()
     },
    );
  }
}