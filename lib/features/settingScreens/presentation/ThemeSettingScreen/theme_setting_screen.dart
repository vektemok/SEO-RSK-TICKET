import 'package:flutter/material.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';

import '../widgets/drop_down_widget.dart';

class ThemeSettingScreen extends StatefulWidget {
  const ThemeSettingScreen({Key? key}) : super(key: key);

  @override
  State<ThemeSettingScreen> createState() => _ThemeSettingScreenState();
}

class _ThemeSettingScreenState extends State<ThemeSettingScreen> {
  final List<String> items = [
    'Темная',
    'Светлая',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              HeaderTextWidget(title: 'Пожалуйся, выберете тему'),
              SizedBox(
                height: 20,
              ),
              CustomDropdownButton2(
                hint: 'Выберите локацию',
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
        ),
      ),
    );
  }
}
