import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:united102/features/pageListScreens/presentation/screens/SecondScreen/second_screen.dart';
import 'package:united102/features/pageListScreens/presentation/screens/thirdScreen/third_screen.dart';
import 'package:united102/iternal/helpers/color_helper.dart';

import '../FirstScreen/first_screen.dart';

class PageListScreen extends StatefulWidget {
  const PageListScreen({super.key});

  @override
  State<PageListScreen> createState() => _PageListScreenState();
}

class _PageListScreenState extends State<PageListScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  final List<Widget> _pages = [FirstScreen(), SeconScreen(), ThirdScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemBuilder: (context, index) {
              return _pages[index % _pages.length];
            },
          ),
          Positioned(
            bottom: 0.h,
            left: 0.w,
            right: 0.w,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _pages.length,
                  (index) => InkWell(
                    onTap: () {
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 305.h, left: 10.w, right: 10.w),
                      child: Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: _activePage == index
                              ? ColorHelper.blue1
                              : Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: ColorHelper.blue1),

                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
