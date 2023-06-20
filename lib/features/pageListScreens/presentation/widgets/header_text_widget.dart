import 'package:flutter/material.dart';
import 'package:united102/iternal/helpers/style_helper.dart';

// ignore: must_be_immutable
class HeaderTextWidget extends StatelessWidget {
  String title;
   HeaderTextWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: headerTextStyle
      ),
    );

  }
}
