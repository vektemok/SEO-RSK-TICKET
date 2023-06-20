import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';
import '../widgets/drop_down_widget.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  final List<String> items = ['Кыргыз тили', 'Русский язык', 'English'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
        leading: IconButton(onPressed: (){
          context.go('/');
        }, icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black,)),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            HeaderTextWidget(
                title: 'Пожалуйста, выберите \n '
                    'язык'),
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
      )),
    );
  }
}
