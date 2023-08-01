/* External dependencies */
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../iternal/helpers/color_helper.dart';

/* Local dependencies */

class Exceptions {
  static showFlushbar(
    String message, {
    required BuildContext context,
    bool isSuccess = false,
    FlushbarPosition? flushbarPosition,
  }) {
    Flushbar(
      backgroundColor: isSuccess ? ColorHelper.blue1 : Color.fromRGBO(231, 81, 81, 1),
      borderRadius: BorderRadius.circular(10.r),
      margin: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      flushbarPosition: flushbarPosition ?? FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: true,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 500),
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
        horizontal: 24.w,
      ),
      messageText: Text(message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
    ).show(context);
  }
}
