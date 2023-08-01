import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:united102/features/serviceSelectionScreens/presentation/ServiceDescriptionScreen/service_description_screen.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/ServiceSelectScreen/servise_select_view_model.dart';
import 'package:united102/features/widgets/my_elevated_button.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';
import 'package:united102/iternal/helpers/style_helper.dart';

import '../../../logic/bloc/service_select_bloc/service_select_bloc.dart';

class ServiceSelectScreen extends StatefulWidget {
  int serviceId;

  ServiceSelectScreen({Key? key, required this.serviceId}) : super(key: key);

  @override
  State<ServiceSelectScreen> createState() => _ServiceSelectScreenState();
}

class _ServiceSelectScreenState extends State<ServiceSelectScreen> {
  int _currentIndex = 0;

  int serviceSelectId = 1;

  void changeColor(int index, int serviceId) {
    setState(() {
      _currentIndex = index;
      serviceSelectId = serviceId;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          centerTitle: Theme.of(context).appBarTheme.centerTitle,
          elevation: Theme.of(context).appBarTheme.elevation,
          leading: IconButton(
            onPressed: () {},
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
        body: BlocProvider<ServiceSelectBloc>(
          create: (context) => ServiceSelectBloc()
            ..add(ServiceFetch(serviceId: widget.serviceId)),
          child: BlocBuilder<ServiceSelectBloc, ServiceSelectState>(
            builder: (context, state) {
              if (state is ServiceSelectLoaded) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: _HeaderText(),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.service.length,
                        itemBuilder: (context, index) {
                          final service = state.service[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        minHeight: 65,
                                        minWidth: 378,
                                        maxHeight: 65,
                                        maxWidth: 378),
                                    child: GestureDetector(
                                      onTap: () =>
                                          changeColor(index, service.id),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient: index == _currentIndex
                                                ? LinearGradient(
                                                    begin: Alignment(0, -1),
                                                    end: Alignment(0, 1),
                                                    colors: <Color>[
                                                      Color(0xfc4097c5),
                                                      Color(0xff0174b1)
                                                    ],
                                                    stops: <double>[0, 1],
                                                  )
                                                : LinearGradient(colors: [
                                                    Colors.white,
                                                    Colors.white
                                                  ]),
                                            border: Border.all(
                                                color: index == _currentIndex
                                                    ? Colors.blue
                                                    : Colors.blue,
                                                width: 1)),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                service.name,
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color: index ==
                                                                _currentIndex
                                                            ? Colors.white
                                                            : Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))),
                          );
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    MyElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ServiceDescriptionScreen(
                                        serviceId: serviceSelectId,
                                        branchId: widget.serviceId,
                                      )));
                        },
                        child: Text(
                          'Далее',
                          style: buttonTextStyle,
                        ))
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
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
          onPressed: () {},
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
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            ScreenSwitcherButton(
              path: '',
              text: 'Далее',
              onPressed: () {},
            )
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
