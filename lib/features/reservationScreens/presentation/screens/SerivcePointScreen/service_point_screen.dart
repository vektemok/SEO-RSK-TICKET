import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/ServiceSelectScreen/service_select_screen.dart';

import 'package:united102/features/widgets/icon_badge_widget.dart';
import 'package:united102/features/widgets/my_elevated_button.dart';
import 'package:united102/iternal/helpers/shared_preferencies_helper.dart';
import 'package:united102/iternal/helpers/style_helper.dart';

import '../../../../logic/bloc/service_point_bloc/service_point_bloc.dart';

class ServicePointScreen extends StatefulWidget {
  int regionId;

  ServicePointScreen({super.key, required this.regionId});

  @override
  State<ServicePointScreen> createState() => _ServicePointScreenState();
}

class _ServicePointScreenState extends State<ServicePointScreen> {
  @override
  Widget build(BuildContext context) {
    int? serviceId;
    return Scaffold(
      appBar: AppBar(
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
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
        child: BlocProvider<ServicePointBloc>(
          create: (context) => ServicePointBloc()
            ..add(ServicePointFetch(regionId: widget.regionId)),
          child: BlocBuilder<ServicePointBloc, ServicePointState>(
            builder: (context, state) {
              if (state is ServicePointLoaded) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Пожалуйста, выберите \n точку обслуживания',
                      style: headerTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.servceModel.length,
                      itemBuilder: (context, index) {
                        final service = state.servceModel[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: InkWell(
                            onTap: () {
                              serviceId = service.id;
                              print(service.id);
                              print(serviceId);
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                              height: 57,
                              width: 378,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromRGBO(229, 229, 229, 1)),
                              ),
                              child: Row(
                                children: [
                                  const Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: LocationIcon(),
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            '${service.region}  ${service.street}'),
                                        Text(
                                            '${service.scheduleStart}   ${service.scheduleEnd} id ${service.id}'),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 12,
                                          ))),
                                  const SizedBox(
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServiceSelectScreen(
                                      serviceId: serviceId!)));
                        },
                        child: const Text('Далee'))
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
      ),
    );
  }
}
