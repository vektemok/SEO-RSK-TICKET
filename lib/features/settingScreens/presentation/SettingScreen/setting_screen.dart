import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:united102/features/profileScreen/presentation/screens/profileScreen/profileScreen.dart';
import 'package:united102/iternal/helpers/utils.dart';


import '../../../../iternal/helpers/style_helper.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> settingName = [
      'Моё местоположение',
      'Языки',
      'Тема',
      'Q&A',
      'Сведения',
      'Уведомления',
    ];

    List<String> settingIcons = [
      'assets/setting_icons/location.svg',
      'assets/setting_icons/language.svg',
      'assets/setting_icons/theme.svg',
      'assets/setting_icons/qa.svg',
      'assets/setting_icons/intelligence.svg',
      'assets/setting_icons/notification.svg',
    ];



    void pushScreen(int index){
  for(int i =0; i <= settingName.length; i++ ){
    if(i == index){

    }
  }
    }


    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        actions: [InkWell(onTap: () {
          customPush(context, ProfileScreen());
        }, child: SvgPicture.asset("assets/icons/icon_user.svg")), SizedBox(width: 16.w,)],
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: ListView.builder(
              itemCount: settingName.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: InkWell(
                    onTap: () => pushScreen(index),
                    child: Container(
                      width: 350.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                     boxShadow: [
                       BoxShadow(
                         color:  Color(0x3f000000),

                         offset:  Offset(0, 2),
                         blurRadius:  2,

                       )
                     ],
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromRGBO(150, 150, 150, 1),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 22.h,
                              width: 30.w,
                              child: SvgPicture.asset(settingIcons[index])),
                          SizedBox(
                            height: 10,
                          ),
                          Text(settingName[index], style: settingTextStyle),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
