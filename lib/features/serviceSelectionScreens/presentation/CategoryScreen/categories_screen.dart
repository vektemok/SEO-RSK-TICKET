import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';

import '../../../widgets/icon_badge_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CategorySelectList(),
            SizedBox(
              height: 20,
            ),
            ScreenSwitcherButton(path: '/service_point'),
          ],
        ),
      ),
    );
  }
}

class _CategorySelectList extends StatefulWidget {
  const _CategorySelectList({Key? key}) : super(key: key);

  @override
  State<_CategorySelectList> createState() => _CategorySelectListState();
}

class _CategorySelectListState extends State<_CategorySelectList> {
  List<String> _categories = [
    'Физические лица',
    'Юри'
        'дическе лица',
    'Платежные карты'
  ];

  int _currentIndex = 0;

  void _changeCategory(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(
                        minHeight: 70,
                        minWidth: 378,
                        maxHeight: 70,
                        maxWidth: 378),
                    child: GestureDetector(
                      onTap: () => _changeCategory(index),
                      child: Container(
                        // margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),

                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: index == _currentIndex
                                ? const LinearGradient(
                                    begin: Alignment(0, -1),
                                    end: Alignment(0, 1),
                                    colors: <Color>[
                                      Color(0xfc4097c5),
                                      Color(0xff0174b1)
                                    ],
                                    stops: <double>[0, 1],
                                  )
                                : const LinearGradient(
                                    colors: [Colors.white, Colors.white]),
                            border: Border.all(
                                color: index == _currentIndex
                                    ? Colors.blue
                                    : Colors.blue,
                                width: 1)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconBadgeWidget(index: index),
                              Text(
                                _categories[index],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: index == _currentIndex
                                            ? Colors.white
                                            : Colors.blue,
                                        fontWeight: FontWeight.w500)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
          );
        });
  }
}
