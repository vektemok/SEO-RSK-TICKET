import 'package:go_router/go_router.dart';
import 'package:united102/app/routes/routes.dart';
import 'package:united102/features/notificationScreens/presentation/NotificationScreen/notification_screen.dart';
import 'package:united102/features/pageListScreens/presentation/screens/PageListScreen/page_list_screen.dart';
import 'package:united102/features/registrationScreens/presentation/screens/LoginScreen/login_screen.dart';
import 'package:united102/features/registrationScreens/presentation/screens/RegistrationScreen/registration_screen.dart';
import 'package:united102/features/reservationScreens/presentation/screens/SpecialNeedsScreen/special_needs_screen.dart';
import 'package:united102/features/reservationScreens/presentation/screens/TicketBookingSuccessScreen/ticket_booking_success_screen.dart';
import 'package:united102/features/reservationScreens/presentation/screens/TicketViewScreen/ticket_view_screen.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/CategoriesSelectScreen/categories_select_screen.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/DocumentListScreen/document_list_screen.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/ServiceDescriptionScreen/service_description_screen.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/ServicePointsSelectionScreen/service_select_screen.dart';
import 'package:united102/features/settingScreens/presentation/IntelligenceSettingScreen/intelligence_setting_screen.dart';
import 'package:united102/features/settingScreens/presentation/LanguageSettingScreen/language_setting_screen.dart';
import 'package:united102/features/settingScreens/presentation/SettingScreen/setting_screen.dart';
import 'package:united102/features/settingScreens/presentation/LocationSettingScreen/location_setting_screen.dart';
import 'package:united102/features/settingScreens/presentation/ThemeSettingScreen/theme_setting_screen.dart';
import 'package:united102/features/appNavigator/AppNavigator/app_navigator.dart';

import '../../features/appNavigator/mainScreen/main_screen.dart';
import '../../features/reservationScreens/presentation/screens/DataEntryScreen/data_entry_screen.dart';
import '../../features/serviceSelectionScreens/presentation/timeSelectScreen/time_select_screen.dart';
import '../../features/settingScreens/presentation/QASettingScreen/qa_setting_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) =>  DataEntryScreen()),
    GoRoute(
      path: "/registration",
      builder: (context, state) =>  RegistrationScreen(),
    ),
    GoRoute(
        path: Routes.settingRoute,
        builder: (context, state) => const SettingScreen()),
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
    GoRoute(
        path: Routes.qaSettingRoute,
        builder: (context, state) => const QASettingScreen()),
    GoRoute(
      path: Routes.appNavigator,
      builder: (context, state) => const AppNavigator(),
    ),
    GoRoute(
        path: Routes.categoriesSelectScreen,
        builder: (context, state) => const CategoriesSelectScreen()),
    GoRoute(
        path: Routes.serviceSelectScreen,
        builder: (context, state) => const ServiceSelectScreen()),
    GoRoute(
        path: Routes.serviceDescriptionScreen,
        builder: (context, state) => const ServiceDescriptionScreen()),
    GoRoute(
        path: Routes.documentListScreen,
        builder: (context, state) => const DocumentListScreen()),
    GoRoute(
        path: Routes.dataEntryScreen,
        builder: (context, state) =>  DataEntryScreen()),
    GoRoute(
        path: Routes.specialNeedsScreen,
        builder: (context, state) => const SpecialNeedsScreen()),
    GoRoute(
        path: Routes.ticketBookingSuccessScreen,
        builder: (context, state) => const TicketBookingSuccessScreen()),
    GoRoute(
        path: Routes.ticketViewScreen,
        builder: (context, state) => const TicketViewScreen()),
  ]);
}
