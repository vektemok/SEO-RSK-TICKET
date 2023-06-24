import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> customPushAndRemoveUntil(BuildContext context, Widget widget) {
  return Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, _, __) => widget,
        transitionDuration: const Duration(microseconds: 300),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
      (Route<dynamic> route) => false);
}

class CustomButtonCard extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  final double width;
  final double height;
  final double bRadius;
  final Color color;
  final TextStyle textStyle;
  final Color backColor;

  const CustomButtonCard({
    super.key,
    required this.onPressed,
    required this.title,
    required this.width,
    required this.height,
    required this.bRadius,
    required this.color,
    required this.textStyle,
    required this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.4.r,
            color: color,
          ),
          borderRadius: BorderRadius.circular(bRadius),
        ),
      ),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
