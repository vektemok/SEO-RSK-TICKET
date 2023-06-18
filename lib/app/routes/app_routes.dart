import 'dart:js';

import 'package:go_router/go_router.dart';
import 'package:united102/app/routes/routes.dart';
import 'package:united102/features/pageListScreens/presentation/screens/LanguageSelectScreen/language_select_screen.dart';
import 'package:united102/features/settingScreens/presentation/LanguageSettingScreen/language_setting_screen.dart';
import 'package:united102/features/settingScreens/presentation/SettingScreen/setting_screen.dart';
import 'package:united102/features/settingScreens/presentation/LocationSettingScreen/location_setting_screen.dart';
import 'package:united102/main_screen.dart';


class AppRouter {
  static final GoRouter router = GoRouter(routes: [


    GoRoute(path: '/',
    builder: (context, state) => const MainScreen()
    ),

    
    GoRoute(
      path: Routes.locationSettingRoute,
      builder: (context, state) =>  const LocationSettingScreen(),
    ),

  GoRoute(path: Routes.languageSettingRoute,
  builder: (context, state) => const LanguageSettingScreen()
  )
  ]);
}
