import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/iternal/helpers/text_style.dart';

class HeaderTextWidget extends StatelessWidget {
  String title;
   HeaderTextWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: headerTextStyle
    );

  }
}
