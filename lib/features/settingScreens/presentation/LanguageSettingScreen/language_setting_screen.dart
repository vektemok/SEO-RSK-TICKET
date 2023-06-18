import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/routes.dart';


class LanguageSettingScreen extends StatelessWidget {
  const LanguageSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(onPressed: ()=> context.go(Routes.settingRoute), child: Text('home'),),
        )
      ),
    );
  }
}
