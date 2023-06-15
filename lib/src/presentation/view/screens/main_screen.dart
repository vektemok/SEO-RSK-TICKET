import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:united102/src/presentation/view/screens/notification_screen.dart';
import 'package:united102/src/presentation/view/screens/setting_screen.dart';
import 'package:united102/src/presentation/view/screens/ticket_screen.dart';

import 'categories_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _screens = [
    CategoriesScreen(),
    TicketScreen(),
    NotificationScreen(),
    SettingScreen()
  ];

  List<bool> _isActive = [true, false, false, false];
  int _currentIndex = 0;

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      _isActive = List<bool>.generate(_isActive.length, (int i) => i == index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: Theme.of(context).appBarTheme.elevation,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: SizedBox(
          height: 80,
          width: 150,
          child: SvgPicture.asset('assets/appbar_rsk.svg'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          //1
          BottomNavigationBarItem(
              icon: _isActive[0]
                  ? SizedBox(
                      width: 82,
                      height: 72,
                      child: SvgPicture.asset('assets/nav_bar_icons/home.svg'))
                  : SizedBox(
                      width: 82,
                      height: 72,
                      child:
                          SvgPicture.asset('assets/nav_bar_icons/home_na.svg')),
              label: ''),
          //2
          BottomNavigationBarItem(
              icon: _isActive[1]
                  ? SizedBox(
                      width: 82,
                      height: 72,
                      child:
                          SvgPicture.asset('assets/nav_bar_icons/ticket.svg'))
                  : SizedBox(
                      width: 82,
                      height: 72,
                      child: SvgPicture.asset(
                          'assets/nav_bar_icons/ticket_na.svg')),
              label: ''),
          //3
          BottomNavigationBarItem(
              icon: _isActive[2]
                  ? SizedBox(
                      width: 82,
                      height: 72,
                      child: SvgPicture.asset(
                          'assets/nav_bar_icons/notification.svg'))
                  : SizedBox(
                      width: 82,
                      height: 72,
                      child: SvgPicture.asset(
                          'assets/nav_bar_icons/notification_na.svg')),
              label: ''),
          //4
          BottomNavigationBarItem(
            icon: _isActive[3]
                ? SizedBox(
                    width: 82,
                    height: 72,
                    child: SvgPicture.asset('assets/nav_bar_icons/home_na.svg'))
                : SizedBox(
                    width: 82,
                    height: 72,
                    child:
                        SvgPicture.asset('assets/nav_bar_icons/home_na.svg')),
            label: '',
          )
        ],
      ),
    );
  }
}
