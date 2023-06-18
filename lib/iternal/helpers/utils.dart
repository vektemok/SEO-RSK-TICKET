import 'package:flutter/material.dart';

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




