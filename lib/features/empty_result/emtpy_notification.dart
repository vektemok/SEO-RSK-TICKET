import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:united102/iternal/helpers/style_helper.dart';


class EmptyNotificationScreen extends StatelessWidget {
  const EmptyNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        backgroundColor:
        Theme.of(context).appBarTheme.backgroundColor,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 51,
            width: 166,
            child: SvgPicture.asset(
              'assets/appbar_rsk.svg',
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 155,
                  width: 169,
                  child: SvgPicture.asset('assets/icons/bell.svg')),
              SizedBox(
                height: 10,
              ),
              Text('У вас пока нет уведломлений' , style:   headerTextStyle,)
            ],
          ),
        ),
      ),
    );
  }
}
