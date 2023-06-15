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

  int _currentIndex = 0;

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
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
              icon: SvgPicture.asset('assets/nav_bar_icons/home_na.svg'),
              activeIcon: SvgPicture.asset('assets/nav_bar_icons/home.svg'),
              label: ''),
          //2
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/nav_bar_icons/ticket_na.svg'),
              activeIcon: SvgPicture.asset('assets/nav_bar_icons/ticket.svg'),
              label: ''),
          //3
          BottomNavigationBarItem(
              icon:
                  SvgPicture.asset('assets/nav_bar_icons/notification.na.svg'),
              activeIcon:
                  SvgPicture.asset('assets/nav_bar_icons/notification.svg'),
              label: ''),
          //4
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num_sharp),
              activeIcon: Icon(Icons.add),
              label: '')
        ],
      ),
    );
  }
}
