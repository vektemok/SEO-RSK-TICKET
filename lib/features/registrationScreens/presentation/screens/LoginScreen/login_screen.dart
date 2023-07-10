import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/app/routes/routes.dart';

import '../../../../../iternal/helpers/color_helper.dart';
import '../../../../widgets/screen_switcher_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 180,
            width: 150,
            child: SvgPicture.asset(
              'assets/appbar_rsk.svg',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 129.h),
            Text(
              "Войти",
              style: GoogleFonts.montserrat(
                  fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 7.w),
              child: Text(
                "Логин:",
                style: GoogleFonts.montserrat(fontSize: 16),
              ),
            ),
            SizedBox(height: 5.h),
            SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r)),
                  hintText: "Логин",
                  suffixIcon: SizedBox(
                      width: 4.5,
                      height: 9,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ColorHelper.blue1,
                      )),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.only(left: 7.w),
              child: Text(
                "Пароль:",
                style: GoogleFonts.montserrat(fontSize: 16),
              ),
            ),
            SizedBox(height: 5.h),
            SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r)),
                  hintText: "Пароль",
                  suffixIcon: SizedBox(
                      width: 4.5,
                      height: 9,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ColorHelper.blue1,
                      )),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScreenSwitcherButton(
                  path: Routes.appNavigator,
                  text: "Войти",
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "У вас нету аккаунта? ",
                  style: GoogleFonts.montserrat(
                    fontSize: 17.sp,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go("/registration");
                  },
                  
                  child: Text(
                    "Зарегистрируйтесь",
                    style: GoogleFonts.montserrat(
                        fontSize: 17.sp, color: ColorHelper.blue1),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
