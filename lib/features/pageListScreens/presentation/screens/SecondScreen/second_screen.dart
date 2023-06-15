import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SeconScreen extends StatefulWidget {
  const SeconScreen({super.key});

  @override
  State<SeconScreen> createState() => _SeconScreenState();
}

class _SeconScreenState extends State<SeconScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/page2.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 400.h,
            left: 150.w,
            child: SvgPicture.asset(
              "assets/icons/icon.svg",
              width: 120.w,
            ),
          ),
          Positioned(
            left: 50,
            bottom: 360.h,
            child: Text(
              "Избегайте долгих ожиданий!",
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