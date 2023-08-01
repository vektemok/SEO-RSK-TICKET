import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SvgPicture.asset(
                  'assets/images/background.svg',
                  alignment: Alignment.center,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,

                  fit: BoxFit.cover,
                );
              },

            ),
            Container(
              child: Column(
                children: [
                  ScreenSwitcherButton(path: '', text: 'Далее', onPressed: () {  },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
