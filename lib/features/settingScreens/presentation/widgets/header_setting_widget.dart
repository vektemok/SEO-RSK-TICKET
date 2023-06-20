import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HeaderSettingWidget extends StatelessWidget {
  String title;

  HeaderSettingWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
          textStyle: TextStyle(
        fontSize: 19.sp,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      )),
    );
  }
}
