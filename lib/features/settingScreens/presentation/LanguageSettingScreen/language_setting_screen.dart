import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';
import '../../../../app/routes/routes.dart';
import '../widgets/drop_down_widget.dart';


class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  final List<String> items = [
    'Кыргыз тили',
    'Русский язык',
    'English'

  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
             HeaderTextWidget(title: 'Пожалуйста, выберете язык'),
              SizedBox(
                height: 10,
              ),
              CustomDropdownButton2(
                hint: 'Выберите язык',
                dropdownItems: items,
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
