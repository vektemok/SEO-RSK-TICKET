import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'categories_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  List<Widget> _screens = [
    CategoriesScreen()
  ];


  int _currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      backgroundColor: Colors.white,
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Мои талоны'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Увеомления'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Настройки '),
        ],
      ),
    );
  }
}
