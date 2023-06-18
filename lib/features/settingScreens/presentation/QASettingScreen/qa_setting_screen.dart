import 'package:flutter/material.dart';



class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });


  List<String> headerT
  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class QASettingScreen extends StatefulWidget {
  const QASettingScreen({Key? key}) : super(key: key);

  @override
  State<QASettingScreen> createState() => _QASettingScreenState();
}

class _QASettingScreenState extends State<QASettingScreen> {
  @override
  Widget build(BuildContext context) {

    const List<String> _data = [];

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index){
          return ExpansionPanelList(
            children:_data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.headerValue),
                  );
                },
                body: ListTile(
                    title: Text(item.expandedValue),
                    subtitle:
                    const Text('To delete this panel, tap the trash can icon'),
                    trailing: const Icon(Icons.delete),
                  ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          );
        }),
      ),
    )
  }
}




// stores ExpansionPanel state information


