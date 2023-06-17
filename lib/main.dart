import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:united102/features/reservationScreens/presentation/screens/SpecialNeedsScreen/special_needs_screen.dart';
import 'package:united102/iternal/themes/white_theme.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/DocumentListScreen/document_list_screen.dart';
import 'package:united102/main_screen.dart';
import 'features/reservationScreens/presentation/screens/DataEntryScreen/data_entry_screen.dart';
import 'features/reservationScreens/presentation/screens/TicketViewScreen/ticket_view_screen.dart';
import 'features/splashScreen/presentation/screens/SplashScreen/splash_screen.dart';
import 'features/ticketHistoryScreens/presentation/screens/UnifyingHistoryScreen/unifying_history_screen.dart';

void main() {
  runApp(const MyApp());
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
          },
        );
      },
      child: MainScreen(),
    );
  }
}
