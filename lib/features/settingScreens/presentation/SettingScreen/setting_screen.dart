import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context, index){
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent
            ),
          );

        })
      ),
    );
  }
}
