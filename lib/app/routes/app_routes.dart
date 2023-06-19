import 'package:go_router/go_router.dart';
import 'package:united102/app/routes/routes.dart';
import 'package:united102/features/notificationScreens/presentation/NotificationScreen/notification_screen.dart';
import 'package:united102/features/pageListScreens/presentation/screens/LanguageSelectScreen/language_select_screen.dart';
import 'package:united102/features/settingScreens/presentation/IntelligenceSettingScreen/intelligence_setting_screen.dart';
import 'package:united102/features/settingScreens/presentation/LanguageSettingScreen/language_setting_screen.dart';
import 'package:united102/features/settingScreens/presentation/SettingScreen/setting_screen.dart';
import 'package:united102/features/settingScreens/presentation/LocationSettingScreen/location_setting_screen.dart';
import 'package:united102/features/settingScreens/presentation/ThemeSettingScreen/theme_setting_screen.dart';
import 'package:united102/main_screen.dart';

import '../../features/settingScreens/presentation/QASettingScreen/qa_setting_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const QASettingScreen()),
    GoRoute(
        path: Routes.settingRoute,
        builder: (context, state) => SettingScreen()),
    GoRoute(
      path: Routes.locationSettingRoute,
      builder: (context, state) => const LocationSettingScreen(),
    ),
    GoRoute(
        path: Routes.languageSettingRoute,
        builder: (context, state) => const LanguageSettingScreen()),
    GoRoute(
        path: Routes.themeSettingRoute,
        builder: (context, state) => const ThemeSettingScreen()),
    GoRoute(
        path: Routes.intelligenceSettingRoute,
        builder: (context, state) => const IntelligenceSettingScreen()),
    GoRoute(
        path: Routes.notificationSettingRoute,
        builder: (context, state) => const NotificationScreen()),
    // GoRoute(path: Routes.qaSettingRoute,
    // builder: (context, state) => const QASettingScreen()
    // )
  ]);
}
