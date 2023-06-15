import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/src/presentation/widgets/screen_switcher_button.dart';

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
          children: [
            _CategorySelectList(),
            SizedBox(
              height: 10,
            ),
            ScreenSwitcherButton(path: 'path')
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
  List<String> _categories = ['Физические лица', 'Юредическе лица', 'Платежные карты'];

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
                        minHeight: 80,
                        minWidth: 299,
                        maxHeight: 80,
                        maxWidth: 299),
                    child: GestureDetector(
                      onTap: () => _changeCategory(index),
                      child: Container(
                        // margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),

                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: index == _currentIndex
                                ? Colors.blue
                                : Colors.white,
                            border: Border.all(
                                color: index == _currentIndex
                                    ? Colors.blue
                                    : Colors.blue,
                                width: 1)),
                        child: Center(
                          child: Text(
                            _categories[index],
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: index == _currentIndex
                                        ? Colors.white
                                        : Colors.blue,
                                    fontWeight: FontWeight.w500)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ))),
          );
        });
  }
}

