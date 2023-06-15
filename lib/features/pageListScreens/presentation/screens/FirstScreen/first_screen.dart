import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
            left: 165.w,
            child: SvgPicture.asset(
              "assets/icons/icon2.svg",
              width: 88.w,
            ),
          ),
          Positioned(
            right: 20.w,
            bottom: 360.h,
            child: Text(
              "Получите быстрое обслуживание!",
              style: TextStyle(fontSize: 24.sp),
            ),
          ),
          Image.asset(
            "assets/images/page5.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
