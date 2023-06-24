import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/notification_param_model.dart';

// Widget buildNotificationCard(NotificationParam item) =>

// ignore: must_be_immutable
class BuildNotificationCard extends StatefulWidget {
  NotificationParam item;

  bool isNew;

  BuildNotificationCard({Key? key, required this.item, required this.isNew})
      : super(key: key);

  @override
  State<BuildNotificationCard> createState() => _BuildNotificationCardState();
}

class _BuildNotificationCardState extends State<BuildNotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5 , 0,  5),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            // boxShadow: widget.boxShadow == true? Box,
          color: widget.isNew == true? const Color(0xb23993c3): Colors.white,
            boxShadow: widget.isNew == true? [
           const   BoxShadow(
                color:  Color(0x3f000000),
                offset:  Offset(0, 2),
                blurRadius: 2
              )
            ]: null,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 0.5, color: const Color.fromRGBO(166, 166, 166, 1))),
        height: 54,
        width: 410,
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 42,
                width: 42,
                child: SvgPicture.asset('assets/rski.svg'),
              ),
            ),
            const Spacer(),
            Align(
              child: Text(
                widget.item.title,
                style: widget.isNew == true
                    ? GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp))
                    : GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: const Color.fromRGBO(116, 116, 116, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp)),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.item.time,
                style: const TextStyle(
                    color: Color.fromRGBO(116, 116, 116, 1),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
