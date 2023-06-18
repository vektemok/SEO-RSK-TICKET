import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/CategoriesSelectScreen/categories_select_screen.dart';
import 'features/notificationScreens/presentation/NotificationScreen/notification_screen.dart';
import 'features/settingScreens/presentation/SettingScreen/setting_screen.dart';
import 'features/ticketHistoryScreens/presentation/screens/UnifyingHistoryScreen/unifying_history_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _screens = [
CategoriesSelectScreen(),
    UnifyingHistoryScreen(),
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
