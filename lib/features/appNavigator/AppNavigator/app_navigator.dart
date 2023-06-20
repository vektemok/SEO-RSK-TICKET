import 'package:flutter/material.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/CategoriesSelectScreen/categories_select_screen.dart';
import '../../notificationScreens/presentation/NotificationScreen/notification_screen.dart';
import '../../settingScreens/presentation/SettingScreen/setting_screen.dart';
import '../../ticketHistoryScreens/presentation/screens/UnifyingHistoryScreen/unifying_history_screen.dart';


class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {

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

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_outlined, color: Colors.black,), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined, color: Colors.black,), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.black,), label: '',),

        ],
selectedItemColor: Colors.blue,
      ),
    );
  }
}







