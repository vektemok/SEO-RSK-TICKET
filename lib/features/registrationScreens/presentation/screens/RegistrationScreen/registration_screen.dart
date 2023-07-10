import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/iternal/helpers/color_helper.dart';

import '../../../../widgets/screen_switcher_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
         leading: IconButton(
          onPressed: () {
            context.go("/");
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
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
              "Регистрация",
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
                "Имя:",
                style: GoogleFonts.montserrat(fontSize: 16),
              ),
            ),
            SizedBox(height: 5.h),
            SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r)),
                  hintText: "Имя",
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
            ScreenSwitcherButton(
              path: "/registration",
              text: "Регистрация",
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Уже зарегистрированы? ",
                  style: GoogleFonts.montserrat(
                    fontSize: 17.sp,
                  ),
                ),
                InkWell(
                    onTap: () {
                      context.go("/");
                    },
                    child: Text(
                      "Войдите",
                      style: GoogleFonts.montserrat(
                          fontSize: 17.sp, color: ColorHelper.blue1),
                    ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
