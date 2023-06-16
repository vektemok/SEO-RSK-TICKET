import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:united102/iternal/helpers/style_helper.dart';

class SpecialNeedsScreen extends StatefulWidget {
  const SpecialNeedsScreen({Key? key}) : super(key: key);

  @override
  State<SpecialNeedsScreen> createState() => _SpecialNeedsScreenState();
}

class _SpecialNeedsScreenState extends State<SpecialNeedsScreen> {
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
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              children: [
                _HeaderText(),
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
      style: descriptionTextStyle,
    );
  }
}
