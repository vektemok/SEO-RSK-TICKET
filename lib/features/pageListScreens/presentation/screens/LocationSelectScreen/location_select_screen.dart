import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/features/widgets/my_elevated_button.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:united102/iternal/helpers/style_helper.dart';

import '../../../../logic/bloc/location_bloc/location_bloc.dart';

class LocationSelectScreen extends StatelessWidget {
  const LocationSelectScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<LocationBloc>(
        create: (context) => LocationBloc()..add(LocationFetch()),
        child: _BodyWidget(),
      );
}

class _BodyWidget extends StatefulWidget {
  const _BodyWidget({super.key});

  @override
  State<_BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {
  int _currentIndex = 0;

  void _changeTheme(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: Theme.of(context).appBarTheme.elevation,
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
            height: 51,
            width: 166,
            child: SvgPicture.asset('assets/appbar_rsk.svg'),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              if (state is LocationLoaded) {
                final location =
                    state.locationModel.results.map((e) => e.name).toList();
                return Column(
                  children: [
                    const _HeaderText(),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: location.length,
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
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                            location[index],
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color:
                                                        index == _currentIndex
                                                            ? Colors.white
                                                            : Colors.blue,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ))),
                          );
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    MyElevatedButton(
                        onPressed: () => context.read<LocationBloc>().add(
                            SaveRegionId(
                                id: _currentIndex + 1, context: context)),
                        child: Text(
                          'Далее',
                          style: buttonTextStyle,
                        ))
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      );
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
