import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/iternal/helpers/style_helper.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              children: [
                _HeaderText(),
SvgPicture.asset('assets/specialNeedsSvg/disability.svg'),
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
                          Text(invalidString[index], style: GoogleFonts
                              .montserrat(
                            textStyle: TextStyle(
                              color: const Color.fromRGBO(51, 48, 48, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),))
                        ],
                      );
                    }),
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
    return Text(description,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: const Color.fromRGBO(51, 48, 48, 1),
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
        ));
  }
}


class SpecialNeedText extends StatelessWidget {
  String asset;
   SpecialNeedText({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(asset);
  }
}

// class ListInvalidCheck extends StatefulWidget {
//   const ListInvalidCheck({Key? key}) : super(key: key);
//
//   @override
//   State<ListInvalidCheck> createState() => _ListInvalidCheckState();
// }
//
// class _ListInvalidCheckState extends State<ListInvalidCheck> {
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
