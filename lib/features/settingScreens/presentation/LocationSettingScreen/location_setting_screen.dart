import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/routes.dart';


class LocationSettingScreen extends StatelessWidget {
  const LocationSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
              onPressed: () => context.go(Routes.settingRoute),
              child: const Text('back')),
        ),
      ),
    );
  }
}
