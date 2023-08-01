
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double width;
  final double height;
  const CustomButtom(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: Alignment(0, -1),
          colors: <Color>[Color(0xfc4097c5), Color(0xff0174b1)],
          end: Alignment(0, 1),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent),
        onPressed: onPressed,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width, vertical: height),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
