import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  String title;
   HeaderWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(51, 48, 48, 1),
            fontWeight: FontWeight.w600,
          )),
    );

  }
}
