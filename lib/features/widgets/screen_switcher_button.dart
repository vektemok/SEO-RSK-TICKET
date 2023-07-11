// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ScreenSwitcherButton extends StatelessWidget {
  String text;
  String path;
  
  ScreenSwitcherButton({

    Key? key,
    required this.text,
    required this.path, required Null Function() onPressed, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> context.go(path),
      child: Container(
        width: 266,
        height: 58,
        margin: const EdgeInsets.fromLTRB(39.53, 0, 23, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: const LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xfc4097c5), Color(0xff0174b1)],
            stops: <double>[0, 1],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
