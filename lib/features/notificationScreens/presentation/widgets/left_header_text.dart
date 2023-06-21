import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


Widget leftHeaderText(String title) =>  Padding(
  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  child:   Text(title,textAlign: TextAlign.left,


    style: GoogleFonts.montserrat(
    textStyle: TextStyle(

      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 18.sp
    )
  ),),
);

