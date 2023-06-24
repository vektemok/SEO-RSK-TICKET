import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/app/routes/routes.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';

class ServiceSelectScreen extends StatefulWidget {
  const ServiceSelectScreen({Key? key}) : super(key: key);

  @override
  State<ServiceSelectScreen> createState() => _ServiceSelectScreenState();
}

class _ServiceSelectScreenState extends State<ServiceSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        elevation: Theme.of(context).appBarTheme.elevation,
        toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: Theme.of(context).iconTheme.color,
            size: Theme.of(context).iconTheme.size,
          ),
        ),
        title: SizedBox(
          height: 80,
          width: 150,
          child: SvgPicture.asset('assets/appbar_rsk.svg'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            const _HeaderText(),
            const SizedBox(
              height: 10,
            ),
            const _ServiceSelectList(),
            const SizedBox(
              height: 20,
            ),
            ScreenSwitcherButton(path: '/ServiceDescriptionScreen', text: 'Далее',)
          ],
        ),
      ),
    );
  }
}


class _ServiceSelectList extends StatefulWidget {
  const _ServiceSelectList({Key? key}) : super(key: key);

  @override
  State<_ServiceSelectList> createState() => _ServiceSelectListState();
}

class _ServiceSelectListState extends State<_ServiceSelectList> {
  List<String> _categories = [
'Отрытие корпаративного счета',
'Отрытие корпаративного счета',
'Отрытие корпаративного счета',
'Отрытие корпаративного счета',
'Отрытие корпаративного счета',
'Отрытие корпаративного счета',

  ];

  int _currentIndex = 0;

  void _changeCategory(int index) {
    setState(() {
      _currentIndex = index;
      context.go(Routes.serviceDescriptionScreen);
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
                    constraints:  BoxConstraints(
                        minHeight: 70.h,
                        minWidth: 378.w,
                        maxHeight: 70.h,
                        maxWidth: 378.w),
                    child: GestureDetector(
                      onTap: () => _changeCategory(index),
                      child: Container(
                        // margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),

                        width: double.infinity,
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


class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Пожалуйста, выберите услугу',
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(51, 48, 48, 1),
            fontWeight: FontWeight.w600,
          )),
    );
  }
}



