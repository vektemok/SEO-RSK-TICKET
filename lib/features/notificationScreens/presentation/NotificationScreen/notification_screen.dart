import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:united102/iternal/helpers/color_helper.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset("assets/appbar_rsk.svg"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 77.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Новые",
                  style: TextStyle(fontSize: 18.sp, fontFamily: "Montserrat"),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: ColorHelper.blue07,
                        borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    width: 410.w,
                    height: 54.h,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_alarm_sharp,
                          size: 40,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 43.w,
                        ),
                        Text(
                          "Ваша очередь началась",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 65.w,
                        ),
                        Text(
                          "08:42",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40.h),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Прочитанные",
                  style: TextStyle(fontSize: 18.sp, fontFamily: "Montserrat"),
                ),
              ],
            ),
             Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    
                    decoration: BoxDecoration(
                    
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: ColorHelper.grey1)),
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    width: 410.w,
                    height: 54.h,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_alarm_sharp,
                          size: 40,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 43.w,
                        ),
                        Text(
                          "Ваша очередь началась",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: ColorHelper.grey1, fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 63.w,
                        ),
                        Text(
                          "08:42",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: ColorHelper.grey1, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
