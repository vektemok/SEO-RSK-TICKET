import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united102/features/pageListScreens/presentation/screens/LocationSelectScreen/location_select_screen.dart';
import 'package:united102/features/pageListScreens/presentation/screens/PageListScreen/page_list_screen.dart';
import 'package:united102/features/registrationScreens/presentation/screens/LoginScreen/login_screen.dart';

import '../../../../../iternal/helpers/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    navigatorHelper();
    super.initState();
  }

  Future navigatorHelper() async {
    await Future.delayed(const Duration(seconds: 3));
    final SharedPreferences prefs =await SharedPreferences.getInstance();
    final String token = prefs.get('token').toString();
    
    if(token.isEmpty){
        Timer(const Duration(seconds: 3), () {

      customPushAndRemoveUntil(context, LoginScreen());
    });
    } else {
     customPushAndRemoveUntil(context, LocationSelectScreen());
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/picture.png",
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 400,
              left: 75,
              child: SvgPicture.asset(
                "assets/appbar_rsk.svg",
                width: 281.w,
              ),),
          Image.asset(
            "assets/images/rsk3.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
