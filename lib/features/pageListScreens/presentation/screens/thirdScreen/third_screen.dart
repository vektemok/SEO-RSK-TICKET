import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app/routes/routes.dart';
import '../../../../widgets/screen_switcher_button.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/page2.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 400.h,
            left: 180.w,
            child: SvgPicture.asset(
              "assets/icons/icon3.svg",
              width: 78.w,
            ),
          ),
          Positioned(
            left: 30.w,
            bottom: 360.h,
            child: Text(
              "Получите быстрое обслуживание!",
              style: TextStyle(fontSize: 24.sp),
            ),
          ),

          Positioned(
            bottom: 200,
            left: 40,
            child: 
          ScreenSwitcherButton(path: Routes.appNavigator,)),
        
          Image.asset(
            "assets/images/page5.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}