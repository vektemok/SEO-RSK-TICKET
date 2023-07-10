import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/app/routes/routes.dart';
import 'package:united102/iternal/helpers/style_helper.dart';

class TicketBookingSuccessScreen extends StatefulWidget {
  const TicketBookingSuccessScreen({Key? key}) : super(key: key);

  @override
  State<TicketBookingSuccessScreen> createState() =>
      _TicketBookingSuccessScreenState();
}

class _TicketBookingSuccessScreenState
    extends State<TicketBookingSuccessScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 96.h,
              width: 96.w,
              child: SvgPicture.asset('assets/icons/ticket_completed.svg'),
            ),
            Text(
              'Вы успешно забронировали очередь!',
              style: headerTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Приходите в банк за несколько минут до указанного времени, чтобы избежать задержек..',
              style: tooltipTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
           _TicketActionList(),
            SizedBox(height: 40.h,),
            ElevatedButton(onPressed: (){
              context.pop();
            }, child: const Text('pop'))
          ],
        ),
      ),
    );
  }
}

class _TicketActionList extends StatefulWidget {
  const _TicketActionList({Key? key}) : super(key: key);

  @override
  State<_TicketActionList> createState() => _TicketActionListState();
}

class _TicketActionListState extends State<_TicketActionList> {

  List<String> titleList = [
    'Посмотреть талон',
    'Изменить бронь',
    'Назад',
  ];

  List<String> svgAssets = [
    'assets/icons/ticket_change.svg',
    'assets/icons/pencil.svg',
    'assets/icons/arrow_back.svg',
  ];
  int _currentIndex = 0;



  void onTap(int index){


    setState(() {

      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ConstrainedBox(
                constraints:
                BoxConstraints(maxHeight: 54.h, maxWidth: 266.w),
                child: InkWell(
                  onTap: ()=> onTap(index),
                  child: Container(
                    width: 266,
                    height: 54,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: index == _currentIndex
                                ? Colors.blue
                                : Colors.blue,
                            width: 1),
                        borderRadius: BorderRadius.circular(8.r),
                        gradient:index == _currentIndex ?  LinearGradient(
                          begin: Alignment(0, -1),
                          end: Alignment(0, 1),
                          colors: <Color>[
                            Color(0xfc4097c5),
                            Color(0xff0174b1)
                          ],
                          stops: <double>[0, 1],
                        ):   LinearGradient(
                            colors: [Colors.white, Colors.white])
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: SvgPicture.asset(
                                svgAssets[index]),
                            height: 24.h,
                            width: 24.w,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(titleList[index],
                              style: GoogleFonts.montserrat(
                                  color: _currentIndex == index ? Colors.white: Colors.blue))
                        ]),

                  ),
                ),
              ),
            ),
          );
        });
  }
}

