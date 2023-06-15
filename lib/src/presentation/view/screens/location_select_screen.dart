import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class LocationSelectScreen extends StatefulWidget {
  const LocationSelectScreen({Key? key}) : super(key: key);

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        elevation: Theme.of(context).appBarTheme.elevation,
        toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
        title:  SizedBox(
          height: 100,
          width: 200,
          child: SvgPicture.asset('assets/appbar_rsk.svg') ,
        ),
      ),
      body: SafeArea(

        child: Column(),
      ),
    );
  }
}
