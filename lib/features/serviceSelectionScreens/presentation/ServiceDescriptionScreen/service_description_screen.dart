import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';

import '../../../../app/routes/routes.dart';

class ServiceDescriptionScreen extends StatefulWidget {
  const ServiceDescriptionScreen({Key? key}) : super(key: key);

  @override
  State<ServiceDescriptionScreen> createState() =>
      _ServiceDescriptionScreenState();
}

class _ServiceDescriptionScreenState extends State<ServiceDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderTextWidget(
                    title: 'Операция по \n'
                        ' корпоративному счету'),
                SizedBox(
                  height: 20.h,
                ),
                DescriptionService(),
                SizedBox(
                  height: 40.h,
                ),

                ElevatedButton.icon(
                    onPressed: () {
                   context.go(Routes.documentListScreen);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(266, 58),
                        backgroundColor: Colors.white,
                        elevation: 0),
                    icon: SizedBox(
                      height: 17,
                      width: 17,
                      child: SvgPicture.asset('assets/icons/document.svg'),
                    ),
                    label: Text(
                      'Требуемые документы',
                      style: GoogleFonts.montserrat(
                        color: Color.fromRGBO(57, 147, 195, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                ScreenSwitcherButton(
                  path: '/DataEntryScreen', text: 'Далее',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DescriptionService extends StatelessWidget {
  const DescriptionService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        'Операции по корпоративному счету включают финансовые транзакции: открытие/закрытие счета, банковские переводы, операции с валютой, платежи, документы.',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.6),
            fontWeight: FontWeight.w400,
          ),
        ),
        textAlign: TextAlign.center);
  }
}
