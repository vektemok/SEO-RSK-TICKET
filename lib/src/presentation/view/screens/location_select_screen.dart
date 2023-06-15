import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationSelectScreen extends StatefulWidget {
  const LocationSelectScreen({Key? key}) : super(key: key);

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        elevation: Theme.of(context).appBarTheme.elevation,
        toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
        title: SizedBox(
          height: 80,
          width: 150,
          child: SvgPicture.asset('assets/appbar_rsk.svg'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_HeaderText()],
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
    return Text(
      'Пожалуйста выберите тему для интерфейса',
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(51, 48, 48, 1),
        fontWeight: FontWeight.w600,
      )),
    );
  }
}
