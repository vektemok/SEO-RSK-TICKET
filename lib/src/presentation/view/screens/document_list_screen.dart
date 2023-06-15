import 'package:flutter/material.dart';
import 'package:united102/src/presentation/widgets/header_widget.dart';


class DocumentListScreen extends StatelessWidget {
  const DocumentListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            HeaderWidget(title: 'Список требуемых документов'),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context,index){
                return Center(
                  child: Text(' -ID pasport'),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
