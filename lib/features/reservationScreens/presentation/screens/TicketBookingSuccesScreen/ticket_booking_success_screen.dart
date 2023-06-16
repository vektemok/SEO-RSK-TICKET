import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
              height: 96.h,
              width: 96.w,
              child: SvgPicture.asset('assets/icons/ticket_completed.svg'),
            ), Text('Вы успешно забронировали очередь!', style: headerTextStyle,),
            Text(
                'Приходите в банк за несколько минут до указанного времени, чтобы избежать задержек..', style: descriptionTextStyle,),

            Container(
              width: 266,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.blue,

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(


                    child: SvgPicture.asset('assets/icons/ticket_change.svg'),
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Посмотреть талон', style: GoogleFonts.montserrat(
                      color: Colors.white
                  )),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _TicketActionsList extends StatefulWidget {
  const _TicketActionsList({Key? key}) : super(key: key);

  @override
  State<_TicketActionsList> createState() => _TicketActionsListState();
}

class _TicketActionsListState extends State<_TicketActionsList> {
  List<String> _categories = [
    'Посмотреть талон',
    'Изменить бронь'
  ];

  int _currentIndex = 0;

  void _changeCategory(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: 70,
                        minWidth: 266,
                        maxHeight: 54,
                        maxWidth: 266),
                    child: GestureDetector(
                      onTap: () => _changeCategory(index),
                      child: Container(
                        // margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                        height: 54.h,
                        width: 266.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: index == _currentIndex
                                ? const LinearGradient(
                              begin: Alignment(0, -1),
                              end: Alignment(0, 1),
                              colors: <Color>[
                                Color(0xfc4097c5),
                                Color(0xff0174b1)
                              ],
                              stops: <double>[0, 1],
                            )
                                : const LinearGradient(
                                colors: [Colors.white, Colors.white]),
                            border: Border.all(
                                color: index == _currentIndex
                                    ? Colors.blue
                                    : Colors.blue,
                                width: 1)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                _categories[index],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: index == _currentIndex
                                            ? Colors.white
                                            : Colors.blue,
                                        fontWeight: FontWeight.w500)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
          );
        });
  }

}



