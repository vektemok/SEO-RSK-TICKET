import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:united102/app/routes/routes.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/ServicePointsSelectionScreen/servise_select_view_model.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';

class ServiceSelectScreen extends StatelessWidget {
  const ServiceSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ServiceSelectViewModel(),
    child: _BodyWidget(),
  );
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        elevation: Theme.of(context).appBarTheme.elevation,
        toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
        leading: IconButton(
          onPressed: () {

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
              height: 30.h,
            ),
            _HeaderText(),
            SizedBox(
              height: 10,
            ),
            _ServiceSelectList(),
            SizedBox(
              height: 20,
            ),
            ScreenSwitcherButton(
              path: Routes.serviceDescriptionScreen,
              text: 'Далее',
            )
          ],
        ),
      ),
    );
  }
}

class _ServiceSelectList extends StatefulWidget {
  const _ServiceSelectList({Key? key}) : super(key: key);

  @override
  State<_ServiceSelectList> createState() => _ServiceSelectListState();
}

class _ServiceSelectListState extends State<_ServiceSelectList> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ServiceSelectViewModel>();
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
                                ?  LinearGradient(
                              begin: Alignment(0, -1),
                              end: Alignment(0, 1),
                              colors: <Color>[
                                Color(0xfc4097c5),
                                Color(0xff0174b1)
                              ],
                              stops: <double>[0, 1],
                            )
                                : LinearGradient(
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

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Пожалуйста, выберите услугу',
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
