import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'features/registrationScreens/presentation/screens/LoginScreen/login_screen.dart';
import 'features/splashScreen/presentation/screens/SplashScreen/splash_screen.dart';
import 'features/widgets/custom_progress_indicator.dart';
import 'iternal/getIt/getIt.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

 WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
