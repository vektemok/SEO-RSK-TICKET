import 'package:flutter/material.dart';


class ScreenSwitcherButton extends StatelessWidget {
  final String title;


   ScreenSwitcherButton({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      child:  Container(
        decoration: BoxDecoration(

        ),
        child:
        Center(
          child: Text(title),
        ) ,
      ),
    );
  }
}
