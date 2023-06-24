import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:united102/iternal/helpers/style_helper.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';

import '../../../../widgets/screen_switcher_button.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({Key? key}) : super(key: key);

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  @override
  Widget build(BuildContext context) {
    const String headerText = 'Пожалуйста, укажите \n'
        'следующие данные';

    List<String> headerTextList = [
      'Фамилия:',
      'Имя:',
      'Отчество:',
      'Дата рождения:',
      'ID пасспорт:',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,


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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderTextWidget(title: headerText),
                  SizedBox(
                    height: 20.h,
                  ),
                  HeaderInputText(headerInputText: headerTextList[0]),
                  PatronymicInput(),
                  HeaderInputText(headerInputText: headerTextList[1]),
                  NameInput(),
                  HeaderInputText(headerInputText: headerTextList[2]),
                  SurnameInput(),
                  HeaderInputText(headerInputText: headerTextList[3]),
                  DateOfBirthInput(),
                  HeaderInputText(headerInputText: headerTextList[4]),
                  IdInput(),
                  SizedBox(
                    height: 20.h,
                  ),
                  TooltipWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  ScreenSwitcherButton(
                    path: '/SpecialNeedsScreen', text: 'Далее',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SurnameInput extends StatelessWidget {
  const SurnameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextField(
        decoration: InputDecoration(
            isCollapsed: true, hintText: 'Введите', hintStyle: hintTextStyle),
      ),
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextField(
        decoration: InputDecoration(
            isCollapsed: true, hintText: 'Введите', hintStyle: hintTextStyle),
      ),
    );
  }
}

class PatronymicInput extends StatelessWidget {
  const PatronymicInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          isCollapsed: true, hintText: 'Введите', hintStyle: hintTextStyle),
    );
  }
}

class IdInput extends StatelessWidget {
  const IdInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextField(
        decoration: InputDecoration(
            isCollapsed: true, hintText: 'Введите', hintStyle: hintTextStyle),
      ),
    );
  }
}

class DateOfBirthInput extends StatelessWidget {
  const DateOfBirthInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextField(
        decoration: InputDecoration(
            isCollapsed: true, hintText: 'Введите', hintStyle: hintTextStyle),
      ),
    );
  }
}

class HeaderInputText extends StatelessWidget {
  final String headerInputText;

  const HeaderInputText({Key? key, required this.headerInputText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Text(
        headerInputText,
        style: descriptionTextStyle,
        textAlign: TextAlign.end,
      ),
    );
  }
}



class TooltipWidget extends StatelessWidget {
  const TooltipWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

      'Мы гарантируем конфиденциальность и безопасность ваших личных данных. Заполнение этих сведений поможет нам обеспечить более эффективное и индивидуальное обслуживание. Благодарим вас за ваше сотрудничество! ',

      style: tooltipTextStyle,
      textAlign: TextAlign.center,
    );
  }
}
