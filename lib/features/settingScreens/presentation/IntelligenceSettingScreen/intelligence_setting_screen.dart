import 'package:flutter/material.dart';

class IntelligenceSettingScreen extends StatefulWidget {
  const IntelligenceSettingScreen({Key? key}) : super(key: key);

  @override
  State<IntelligenceSettingScreen> createState() =>
      _IntelligenceSettingScreenState();
}

class _IntelligenceSettingScreenState extends State<IntelligenceSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Intelell'),
        ),
      ),
    );
  }
}
