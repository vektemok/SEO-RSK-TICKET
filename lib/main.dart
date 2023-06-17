import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:united102/features/reservationScreens/presentation/screens/SpecialNeedsScreen/special_needs_screen.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/ServiceDescriptionScreen/service_description_screen.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/ServiceSelectScreen/service_select_screen.dart';
import 'package:united102/iternal/themes/white_theme.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/DocumentListScreen/document_list_screen.dart';
import 'package:united102/main_screen.dart';
import 'features/reservationScreens/presentation/screens/DataEntryScreen/data_entry_screen.dart';
import 'features/reservationScreens/presentation/screens/TicketBookingSuccessScreen/ticket_booking_success_screen.dart';
import 'features/reservationScreens/presentation/screens/TicketViewScreen/ticket_view_screen.dart';
import 'features/splashScreen/presentation/screens/SplashScreen/splash_screen.dart';
import 'features/ticketHistoryScreens/presentation/screens/UnifyingHistoryScreen/unifying_history_screen.dart';

void main() {
  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: whiteTheme,
          home: child,
          routes: {
            '/ServiceSelectScreen': (context) => ServiceSelectScreen(),
            '/ServiceDescriptionScreen': (context) =>
                ServiceDescriptionScreen(),
            '/DocumentListScreen': (context) => DocumentListScreen(),
            'MainScreen': (context) => MainScreen(),
            '/DataEntryScreen': (context) => DataEntryScreen(),
            '/SpecialNeedsScreen': (context) => SpecialNeedsScreen(),
            '/TicketBookingSuccessScreen': (context) =>
                TicketBookingSuccessScreen(),
            '/TicketViewScreen': (context) => TicketViewScreen()
          },
        );
      },
      child: MainScreen(),
    );
  }
}
