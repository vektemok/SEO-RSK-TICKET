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
        child:ExpansionPanelList(
          elevation: 3,
          expansionCallback: (index, isExpanded) {
            setState(() {
              qaDescription[index]['isExpanded'] = !isExpanded;
            });
          },
          animationDuration: Duration(milliseconds: 600),
          children: qaDescription
              .map(
                (item) => ExpansionPanel(
              canTapOnHeader: true,
              backgroundColor:
              item['isExpanded'] == true ? Colors.cyan[100] : Colors.white,
              headerBuilder: (_, isExpanded) => Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    item['title'],
                    style: TextStyle(fontSize: 20),
                  )),
              body: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Text(item['description']),
              ),
              isExpanded: item['isExpanded'],
            ),
          )
              .toList(),
        ),

      ),
    );
  }
}







