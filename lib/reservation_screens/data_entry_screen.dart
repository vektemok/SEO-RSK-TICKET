import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:united102/iternal/helpers/text_style.dart';
import 'package:united102/src/presentation/widgets/header_text_widget.dart';

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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderTextWidget(title: headerText),
                  const SizedBox(
                    height: 20,
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
    return TextField(
      decoration:
          InputDecoration(hintText: 'Введите', hintStyle: hintTextStyle),
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(hintText: 'Введите', hintStyle: hintTextStyle),
    );
  }
}

class PatronymicInput extends StatelessWidget {
  const PatronymicInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(hintText: 'Введите', hintStyle: hintTextStyle),
    );
  }
}

class IdInput extends StatelessWidget {
  const IdInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(hintText: 'Введите', hintStyle: hintTextStyle),
    );
  }
}

class DateOfBirthInput extends StatelessWidget {
  const DateOfBirthInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(hintText: 'Введите', hintStyle: hintTextStyle),
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
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        headerInputText,
        style: descriptionTextStyle,
        textAlign: TextAlign.end,
      ),
    );
  }
}
