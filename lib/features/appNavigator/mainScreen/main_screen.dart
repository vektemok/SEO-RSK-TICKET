import 'package:flutter/material.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/CategoriesSelectScreen/categories_select_screen.dart';
import '../../notificationScreens/presentation/NotificationScreen/notification_screen.dart';
import '../../settingScreens/presentation/SettingScreen/setting_screen.dart';
import '../../ticketHistoryScreens/presentation/screens/UnifyingHistoryScreen/unifying_history_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
// _isActive = List<bool>.generate(_isActive.length, (int i) => i == index);
    });
  }

  List<Widget> _screens = [
    CategoriesSelectScreen(),
    UnifyingHistoryScreen(),
    NotificationScreen(),
    SettingScreen()
  ];
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: _screens[_currentIndex],
        bottomNavigationBar: GNav(
            backgroundColor: Colors.white,
            selectedIndex: _currentIndex,
            onTabChange: onTap,

            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.alternateTicket ,
                text: 'Likes',
              ),
              GButton(
                icon: LineIcons.bellAlt,
                text: 'Search',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              )
            ]
        )
    );
  }
}







