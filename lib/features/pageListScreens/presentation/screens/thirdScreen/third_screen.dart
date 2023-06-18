import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../iternal/helpers/utils.dart';

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
          // CustomButtonCard(bRadius: 8.r, width: 230.w, height: 50.h, onPressed: () { 

          //  }, title: 'Начать', textStyle: null, backColor: null, color: null,),
          Image.asset(
            "assets/images/page5.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}