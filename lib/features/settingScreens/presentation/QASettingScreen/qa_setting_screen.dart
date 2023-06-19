import 'package:flutter/material.dart';
import 'package:united102/features/settingScreens/presentation/QASettingScreen/qa_model.dart';





class QASettingScreen extends StatefulWidget {
  const QASettingScreen({Key? key}) : super(key: key);

  @override
  State<QASettingScreen> createState() => _QASettingScreenState();
}

class _QASettingScreenState extends State<QASettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: ExpansionPanelList(
          elevation: 0,
          children: qaDescription.map((item) => ExpansionPanel(headerBuilder: (_, isExpanded)=> Container(
            child: Text(item['title']),
          ), body: Container(
            child: Center(
              child: Text(item['description']),
            ),
          ))).toList(),
        ),
      ),
    );
  }
}







