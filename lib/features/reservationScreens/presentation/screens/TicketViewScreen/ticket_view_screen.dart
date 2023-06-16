import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';



// Р

class TicketViewScreen extends StatelessWidget {
  const TicketViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            children: [
SizedBox(
  width: double.infinity,
  height: 500,
  child: SvgPicture.asset('assets/icons/ticket_view.svg'),
),

            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(onPressed: (){},

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(8.r)
                  ),
                  fixedSize: Size(266.w, 54.h),
backgroundColor: Color(0xff3993c3),

                ),
                icon: SizedBox(
                  child: SvgPicture.asset('assets/icons/share.svg'),
                ),
                label: Text('Поделиться', style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.white,
                      fontWeight: FontWeight.w400

                    )
                ),)),
            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(onPressed: (){},
                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.white,
                  elevation: 0,
                  fixedSize: Size(266.w, 54.h)
                ),
                
                icon: SvgPicture.asset('assets/icons/cancel.svg'), label: Text('Отменить бронь', style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.red
                  )
                ),)),
            ],
          ),
        ),
      ),
    );
  }
}

