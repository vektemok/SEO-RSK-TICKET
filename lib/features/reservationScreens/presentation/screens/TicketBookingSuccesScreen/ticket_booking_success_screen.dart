import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class TicketBookingSuccessScreen extends StatefulWidget {
  const TicketBookingSuccessScreen({Key? key}) : super(key: key);

  @override
  State<TicketBookingSuccessScreen> createState() => _TicketBookingSuccessScreenState();
}

class _TicketBookingSuccessScreenState extends State<TicketBookingSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: Theme
            .of(context)
            .appBarTheme
            .centerTitle,
        backgroundColor: Theme
            .of(context)
            .appBarTheme
            .backgroundColor,
        elevation: Theme
            .of(context)
            .appBarTheme
            .elevation,
        toolbarHeight: Theme
            .of(context)
            .appBarTheme
            .toolbarHeight,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 180,
            width: 150,
            child: SvgPicture.asset(
              'assets/appbar_rsk.svg',
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
 SizedBox(
   height: 96.r ,
   width: 96.r,
   child: SvgPicture.asset('assets/icons/ticket_completed.svg'),
 )
          ],
        ),
      ),
    );
  }
}
