import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:united102/app/notifications/ticket_waiting_nofication.dart';
import 'package:united102/app/routes/routes.dart';
import 'package:united102/features/appNavigator/mainScreen/main_screen.dart';
import 'package:united102/features/logic/bloc/theme_bloc/theme_bloc.dart';
import 'package:united102/features/pageListScreens/presentation/screens/LocationSelectScreen/location_select_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:united102/features/reservationScreens/presentation/screens/SerivcePointScreen/service_point_screen.dart';
import 'features/reservationScreens/presentation/screens/DataEntryScreen/data_entry_screen.dart';
import 'features/serviceSelectionScreens/presentation/ServiceSelectScreen/service_select_screen.dart';
import 'features/widgets/custom_progress_indicator.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'iternal/getIt/getIt.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: androidInitializationSettings));

    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    runApp(const MyApp());
  }, (error, stack) {
    print('Ошибка запуска $error');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => ThemeBloc())
        ],
        child: BlocConsumer<ThemeBloc, ThemeState>(
          listener: (context, state) {
            if (state is BlackThemeState) {
              debugPrint('$state');
            }
          },
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(430, 932),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  builder: FlutterSmartDialog.init(
                    loadingBuilder: (String msg) =>
                        CustomProgressIndicator(msg: msg),
                  ),
                  debugShowCheckedModeBanner: false,
                  title: 'First Method',
                  theme: state.currentTheme,
                  initialRoute: Routes.regionSelectScreen,
                  // localizationsDelegates: const [
                  //   AppLocalizations.delegate,
                  //   GlobalMaterialLocalizations.delegate,
                  //   GlobalWidgetsLocalizations.delegate,
                  //   GlobalCupertinoLocalizations.delegate,
                  // ],
                  // supportedLocales: const [
                  //   Locale('en'), // English
                  //   Locale('kg'), // Kyrgyz
                  //   Locale('ru'), // Russian
                  // ],

                  routes: {
                    Routes.regionSelectScreen: (context) => MainScreen()
                  },
                );
              },
            );
          },
        ),
      );
}
