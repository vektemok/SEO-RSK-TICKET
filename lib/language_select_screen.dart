import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
class LanguageSelectScreen extends StatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  int _currentIndex = 1;

  void changeLanguage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> language = [
      '''
En 
Please seslect  a
language
''',
      '''
Кг
Сураныч, тилди
танданыз
''',
      '''
 Рус
 Пожалуйста, 
 выберите язык
''',
    ];

    void changeLang(int index) {
      switch (index) {
        case 0:
          print(' change lang en');
          break;
        case 1:
          print('chagne lang kg');
          break;
        case 2:
          print(' change lang ru');
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: SvgPicture.asset('assets/'),
        ) ,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: language.length,
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
                              onTap: () => changeLanguage(index),
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
                                    language[index],
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
                }),
          ],
        ),
      ),
    );
  }
}
