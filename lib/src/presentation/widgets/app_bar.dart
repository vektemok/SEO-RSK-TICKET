import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: Theme.of(context).appBarTheme.centerTitle,
      elevation: Theme.of(context).appBarTheme.elevation,
      toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.arrow_left,
          color: Theme.of(context).iconTheme.color,
          size: Theme.of(context).iconTheme.size,
        ),
      ),
      title: SizedBox(
        height: 80,
        width: 150,
        child: SvgPicture.asset('assets/appbar_rsk.svg'),
      ),
    );
  }
}
