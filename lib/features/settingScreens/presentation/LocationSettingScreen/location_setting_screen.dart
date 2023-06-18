import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';

import '../../../../app/routes/routes.dart';


import '../widgets/drop_down_widget.dart';


class LocationSettingScreen extends StatefulWidget {
  const LocationSettingScreen({Key? key}) : super(key: key);

  @override
  State<LocationSettingScreen> createState() => _LocationSettingScreenState();
}

class _LocationSettingScreenState extends State<LocationSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            HeaderTextWidget(title: 'Пожалуйста, выберете ваше местоположение'),
          const  SizedBox(
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
    );
  }
}



final List<String> items = [
  'Бишкек',
  'Ош',
  'Нарын',
  'Талас',
  'Джалал Абад',

];
String? selectedValue;