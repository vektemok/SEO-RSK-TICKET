import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';

class DocumentListScreen extends StatelessWidget {
  String optionalDocument;
  String documents;

  DocumentListScreen(
      {Key? key, required this.documents, required this.optionalDocument})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
        leading: IconButton(
          onPressed: () {
            context.pop();
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
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            HeaderTextWidget(title: 'Список требуемых документов'),
            SizedBox(
              height: 15,
            ),
            Text(documents),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeaderTextWidget(title: 'Не обязательные'),
            ),
            Text(optionalDocument)
          ],
        ),
      ),
    );
  }
}
