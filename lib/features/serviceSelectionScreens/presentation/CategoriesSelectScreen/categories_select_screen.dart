import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/CategoriesSelectScreen/categories_view_model.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';

import '../../../widgets/icon_badge_widget.dart';

class CategoriesSelectScreen extends StatelessWidget {
  const CategoriesSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => CategoriesViewModel(),
        child: _BodyWidget(),
      );
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 180,
            width: 150,
            child: SvgPicture.asset(
              'assets/appbar_rsk.svg',
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CategorySelectList(),
            const SizedBox(
              height: 20,
            ),
            ScreenSwitcherButton(
              path: '/ServiceSelectScreen',
              text: 'Далее',
            ),
          ],
        ),
      ),
    );
  }
}

class _CategorySelectList extends StatelessWidget {
  const _CategorySelectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategoriesViewModel>(context);
    return ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: ConstrainedBox(
                    constraints:  BoxConstraints(
                        minHeight: 70,
                        minWidth: 378,
                        maxHeight: 70,
                        maxWidth: 378),
                    child: GestureDetector(
                      onTap: () => viewModel.changeCategory(index),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: index == viewModel.currentIndex
                                ?   LinearGradient(
                                    begin: Alignment(0, -1),
                                    end: Alignment(0, 1),
                                    colors: <Color>[
                                      Color(0xfc4097c5),
                                      Color(0xff0174b1)
                                    ],
                                    stops: <double>[0, 1],
                                  )
                                :  LinearGradient(
                                    colors: [Colors.white, Colors.white]),
                            border: Border.all(
                                color: index == viewModel.currentIndex
                                    ? Colors.blue
                                    : Colors.blue,
                                width: 1)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconBadgeWidget(index: index),
                              Text(
                                viewModel.categories[index],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: index == viewModel.currentIndex
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
