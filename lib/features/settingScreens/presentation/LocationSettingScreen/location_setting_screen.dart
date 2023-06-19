import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
  final List<String> items = [
    'Бишкек',
    'Ош',
    'Нарын',
    'Талас',
    'Джалал Абад',

  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:    AppBar(
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
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
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
      ),
    );
  }
}



