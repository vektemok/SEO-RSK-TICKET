import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';

class LocationSelectScreen extends StatefulWidget {
  const LocationSelectScreen({Key? key}) : super(key: key);

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: Theme.of(context).iconTheme.color,
            size: Theme.of(context).iconTheme.size,
          ),
        ),
        title: SizedBox(
          height: 80,
          width: 150,
          child: SvgPicture.asset('assets/appbar_rsk.svg'),
        ),
      ),
      body: SafeArea(
        child: Column(

          children: [
            SizedBox(
              height: 40,
            ),
            _HeaderText(),
            SizedBox(
              height: 20,
            ),
            _LocationSelectList(),
            SizedBox(
              height: 20,
            ),


            ScreenSwitcherButton(path: '/', text: '', onPressed: () {  },)
          ],
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Пожалуйста, выберите ваше местоположение',
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(51, 48, 48, 1),
        fontWeight: FontWeight.w600,
      )),
    );
  }
}

class _LocationSelectList extends StatefulWidget {
  const _LocationSelectList({Key? key}) : super(key: key);

  @override
  State<_LocationSelectList> createState() => _LocationSelectListState();
}

class _LocationSelectListState extends State<_LocationSelectList> {
  List<String> themes = [
    'Бишкек',
    'Талас',
    'Баткен',
    'Ош',
    'Иссык-Куль ',
  ];

  int _currentIndex = 0;

  void _changeTheme(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: themes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(
                        minHeight: 60,
                        minWidth: 266,
                        maxHeight: 60,
                        maxWidth: 266),
                    child: GestureDetector(
                      onTap: () => _changeTheme(index),
                      child: Container(
                        // margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),

                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
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
                            themes[index],
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
