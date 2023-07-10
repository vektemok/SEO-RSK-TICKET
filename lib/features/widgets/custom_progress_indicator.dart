/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */

import '../../iternal/helpers/color_helper.dart';

class CustomProgressIndicator extends StatelessWidget {
  final String? msg;

  const CustomProgressIndicator({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(
            color: ColorHelper.blue1, 
            strokeWidth: 2.0,
          ),
          Text(
            msg ?? 'Загрузка...',
            style: TextStyle(
              fontSize: 16.sp,
              color: ColorHelper.blue1,
            ),
          ),
        ],
      ),
    );
  }
}
