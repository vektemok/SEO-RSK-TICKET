import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'app/notifications/ticket_waiting_nofication.dart';
import 'features/registrationScreens/presentation/screens/LoginScreen/login_screen.dart';
import 'features/splashScreen/presentation/screens/SplashScreen/splash_screen.dart';
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
  Widget build(BuildContext context) {
    return
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: FlutterSmartDialog.init(
            loadingBuilder: (String msg) => CustomProgressIndicator(msg: msg),
          ),
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            fontFamily: 'Lato',
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(
              fontSizeFactor: 1.sp,
              bodyColor: Colors.black,
            ),
          ),
          // ignore: prefer_const_constructors
          home: SplashScreen(),
        );
      },
    );
  }
}
