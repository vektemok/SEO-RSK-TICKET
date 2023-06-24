import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/iternal/helpers/style_helper.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';

class SpecialNeedsScreen extends StatefulWidget {
  const SpecialNeedsScreen({Key? key}) : super(key: key);

  @override
  State<SpecialNeedsScreen> createState() => _SpecialNeedsScreenState();
}

class _SpecialNeedsScreenState extends State<SpecialNeedsScreen> {
  List<bool> isChecked = [
    true,
    false,
    false,
    false,
    false,
  ];

  List<String> invalidString = [
    'Нет',
    'Да, физическая',
    'Да, зрительная',
    'Да, слуховая',
    'Другое',
  ];
  List<bool> isCheckedB = [
    true,
    false,
    false,
    false,

  ];

  List<String> valueListP = [
    'Нет',
    'Да',

  ];
  List<bool> isCheckedP = [
    true,
    false,

  ];

  List<String> valueListB = [
    'Нет',
    'Да, первый триместр',
    'Да, второй триместр',
    'Да, третий триметр',

  ];

  List<String> specialNeedsList = [
    'assets/specialNeedsSvg/disability.svg',
        'assets/specialNeedsSvg/pensioner.svg',
    'assets/specialNeedsSvg/pregnancy.svg',

  ];

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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeaderText(),
                SpecialNeedText(asset: specialNeedsList[0]),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: isChecked.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Checkbox(
                              splashRadius: 20,
                              value: isChecked[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked[index] = value!;
                                });
                              }),
                          Text(invalidString[index],
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: const Color.fromRGBO(51, 48, 48, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              )),
                        ],
                      );
                    }),
                SpecialNeedText(asset: specialNeedsList[1]),
                ListInvalidCheck(valueList: valueListP, isChecked: isCheckedP),
                SpecialNeedText(asset: specialNeedsList[2]),

                ListInvalidCheck(valueList: valueListB, isChecked: isCheckedB),
                SizedBox(
                  height: 20,
                ),
                DescriptionText(),
                SizedBox(
                  height: 20,
                ),
                ScreenSwitcherButton(path: '/TicketBookingSuccessScreen', text: 'Далее',),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description =
        'Пожалуйста, укажите, если у вас есть особые потребности в связи с инвалидностью, беременностью или пенсионерством:';
    return Text(
      description,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: const Color.fromRGBO(51, 48, 48, 1),
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SpecialNeedText extends StatelessWidget {
  String asset;

  SpecialNeedText({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child:
          SizedBox(height: 40.h, width: 174.w, child: SvgPicture.asset(asset)),
    );
  }
}

// ignore: must_be_immutable
class ListInvalidCheck extends StatefulWidget {
  List<String> valueList;
  List<bool> isChecked;

  ListInvalidCheck({Key? key, required this.valueList, required this.isChecked})
      : super(key: key);

  @override
  State<ListInvalidCheck> createState() => _ListInvalidCheckState();
}

class _ListInvalidCheckState extends State<ListInvalidCheck> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.isChecked.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Checkbox(
                  splashRadius: 20,
                  value: widget.isChecked[index],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.isChecked[index] = value!;
                    });
                  }),
              Text(widget.valueList[index],
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: const Color.fromRGBO(51, 48, 48, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  )),
            ],
          );
        });
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description =
        'Мы гарантируем конфиденциальность и безопасность ваших личных данных. Заполнение этих сведений поможет нам обеспечить более эффективное и индивидуальное обслуживание. Благодарим вас за ваше сотрудничество!';
    return Text(
      description,
      textAlign: TextAlign.center,
      style: tooltipTextStyle,
    );
  }
}
