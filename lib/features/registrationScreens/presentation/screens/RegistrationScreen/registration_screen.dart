import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../iternal/getIt/getIt.dart';
import '../../../../../iternal/helpers/color_helper.dart';
import '../../../../../iternal/helpers/utils.dart';
import '../../../../widgets/custom_buttom.dart';
import '../../../../widgets/custom_flushbar.dart';
import '../../logic/bloc/auth_bloc.dart';
import '../LoginScreen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  late AuthBloc bloc;

  @override
  void initState() {
    bloc = getIt<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: Theme.of(context).appBarTheme.elevation,
          backgroundColor: Colors.white,
          centerTitle: true,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 110.h),
              Text(
                "Регистрация",
                style: GoogleFonts.montserrat(
                    fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: Text(
                  "Эл.почта:",
                  style: GoogleFonts.montserrat(fontSize: 16),
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r)),
                    hintText: "Эл.почта:",
                    suffixIcon: SizedBox(
                      width: 4.5,
                      height: 9,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ColorHelper.blue1,
                      ),
                    ),
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
                  controller: nameController,
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
                      ),
                    ),
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
                  controller: passwordController,
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
                  BlocListener<AuthBloc, AuthState>(
                    bloc: bloc,
                    listener: (context, state) {
                      log(state.toString());
                      if (state is AuthLoadingState) {
                        SmartDialog.showLoading(msg: "Загрузка...");
                      }

                      if (state is SuccessRegistatrionLoadedState) {
                        SmartDialog.dismiss();
                        customPush(context, const LoginScreen());
                        Exceptions.showFlushbar("Вы зарегистрировались",
                            context: context, isSuccess: true);
                      }

                      if (state is AuthErrorState) {
                        SmartDialog.dismiss();

                        Exceptions.showFlushbar(
                          state.error.message.toString(),
                          context: context,
                        );
                      }
                    },
                    child: CustomButtom(
                      onPressed: () {
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          bloc.add(
                            RegistrationEvent(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text),
                          );
                        } else {
                          Exceptions.showFlushbar(
                            'Заполните все поля',
                            context: context,
                          );
                        }
                      },
                      text: 'Зарегистрироваться',
                      width: 50.w,
                      height: 18.h,
                    ),
                  )
                ],
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
                      customPushAndRemoveUntil(context, LoginScreen());
                    },
                    child: Text(
                      "Войдите",
                      style: GoogleFonts.montserrat(
                          fontSize: 17.sp, color: ColorHelper.blue1),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
