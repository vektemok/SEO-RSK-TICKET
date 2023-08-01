import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/DocumentListScreen/document_list_screen.dart';
import 'package:united102/features/serviceSelectionScreens/presentation/timeSelectScreen/time_select_screen.dart';
import 'package:united102/features/widgets/my_elevated_button.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';

import '../../../logic/bloc/service_description_bloc/service_description_bloc.dart';

class ServiceDescriptionScreen extends StatefulWidget {
  int branchId;
  int serviceId;

  ServiceDescriptionScreen(
      {Key? key, required this.serviceId, required this.branchId})
      : super(key: key);

  @override
  State<ServiceDescriptionScreen> createState() =>
      _ServiceDescriptionScreenState();
}

class _ServiceDescriptionScreenState extends State<ServiceDescriptionScreen> {
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
        child: BlocProvider<ServiceDescriptionBloc>(
          create: (context) => ServiceDescriptionBloc()
            ..add(ServiceDescriptionFetch(
                serviceId: widget.serviceId, branchId: widget.branchId)),
          child: BlocBuilder<ServiceDescriptionBloc, ServiceDescriptionState>(
            builder: (context, state) {
              if (state is ServiceDescriptionLoaded) {
                final serviceDescription = state.serviceDescription[0];
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeaderTextWidget(
                            title: 'Операция  \n'
                                ' ${serviceDescription.name}'),
                        SizedBox(
                          height: 20.h,
                        ),
                        DescriptionService(
                          descriptionText: serviceDescription.description,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DocumentListScreen(
                                          documents:
                                              serviceDescription.documents,
                                          optionalDocument: serviceDescription
                                              .optionalDocuments)));
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(266, 58),
                                backgroundColor: Colors.white,
                                elevation: 0),
                            icon: SizedBox(
                              height: 17,
                              width: 17,
                              child:
                                  SvgPicture.asset('assets/icons/document.svg'),
                            ),
                            label: Text(
                              'Требуемые документы',
                              style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(57, 147, 195, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        MyElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TimeSelectScreen(queue: serviceDescription.id,)));
                            },
                            child: const Text('Далее'))
                      ],
                    ),
                  ),
                );
              } else if (state is ServiceDescriptionError) {
                return const Center(
                  child: Text('Error'),
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

class DescriptionService extends StatelessWidget {
  String descriptionText;

  DescriptionService({Key? key, required this.descriptionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(descriptionText,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.6),
            fontWeight: FontWeight.w400,
          ),
        ),
        textAlign: TextAlign.center);
  }
}
