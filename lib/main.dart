import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:united102/app/notifications/ticket_waiting_nofication.dart';
import 'package:united102/features/logic/bloc/theme_bloc/theme_bloc.dart';

import 'app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: androidInitializationSettings
      )
    );

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
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'First Method',
                  theme: state.currentTheme,
                  routerConfig: AppRouter.router,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en'), // English
                    Locale('kg'), // Kyrgyz
                    Locale('ru'), // Russian
                  ],
                );
              },
            );
          },
        ),
      );
}
