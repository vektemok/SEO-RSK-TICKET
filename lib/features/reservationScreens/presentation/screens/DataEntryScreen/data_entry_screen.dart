import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';
import 'package:united102/features/reservationScreens/presentation/screens/TicketBookingSuccessScreen/ticket_booking_success_screen.dart';
import 'package:united102/features/widgets/my_elevated_button.dart';
import 'package:united102/iternal/helpers/style_helper.dart';

import '../../../../logic/bloc/booking_bloc/booking_bloc.dart';
import '../../../data/model/booking_model.dart';

class DataEntryScreen extends StatefulWidget {
  int queue;
  String data;
  String time;

  DataEntryScreen(
      {super.key, required this.queue, required this.data, required this.time});

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Booking booking = Booking(
        firstName: 'Egor',
        lastName: 'lolo',
        surname: 'one',
        pasport: 'a12323232',
        phoneNumber: '99766126262',
        time: '14:00:00',
        date: '2023-08-13',
        queue: '9');

// loly  istanbul1

    return BlocProvider<BookingBloc>(
      create: (context) => BookingBloc(),
      child: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          return Form(
              key: formKey,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  centerTitle: Theme.of(context).appBarTheme.centerTitle,
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 51,
                      width: 166,
                      child: SvgPicture.asset(
                        'assets/appbar_rsk.svg',
                      ),
                    ),
                  ),
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(70, 20, 70, 10),
                          child: HeaderTextWidget(
                              title: 'Пожалуйста, укажите следующие данные'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(37, 40, 37, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderInputText(text: 'Имя:'),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Введите',
                                    hintStyle: hintTextStyle,
                                    isCollapsed: false),
                                controller: nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Пожалуйста,  укажите имя';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              HeaderInputText(text: 'Фамилия:'),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Введите',
                                    hintStyle: hintTextStyle,
                                    isCollapsed: false),
                                controller: lastNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Пожалуйста, укажите фамилию';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              HeaderInputText(text: 'Отчество:'),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Введите',
                                    hintStyle: hintTextStyle,
                                    isCollapsed: false),
                                controller: surnameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Пожалуйста, укажите отчество';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              HeaderInputText(text: 'Номер:'),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Введите',
                                    hintStyle: hintTextStyle,
                                    isCollapsed: false),
                                controller: phoneNumberController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Пожалуйста, укажите номер';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              HeaderInputText(text: 'Паспорт:'),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Введите',
                                    hintStyle: hintTextStyle,
                                    isCollapsed: false),
                                controller: passportController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Пожалуйста, укажите паспорт';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  textAlign: TextAlign.center,
                                  style: tooltipTextStyle,
                                  'Мы гарантируем конфиденциальность и безопасность ваших личных данных. Заполнение этих сведений поможет нам обеспечить более эффективное и индивидуальное обслуживание. Благодарим вас за ваше сотрудничество!')
                            ],
                          ),
                        ),
                        MyElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<BookingBloc>().add(
                                    PostBookingEvent(
                                        firstName: nameController.text,
                                        lastName: lastNameController.text,
                                        surname: surnameController.text,
                                        phoneNumber: phoneNumberController.text,
                                        time: widget.time,
                                        passport: passportController.text,
                                        queue: widget.queue.toString(),
                                        date: widget.data));
                              }

                              Future.delayed(
                                  const Duration(seconds: 5),
                                  () => MaterialPageRoute(
                                      builder: (context) =>
                                          const TicketBookingSuccessScreen()));
                            },
                            child: const Text('Далее'))
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}

class HeaderInputText extends StatelessWidget {
  final String text;

  const HeaderInputText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Text(
        textAlign: TextAlign.start,
        text,
        style: ticketText,
      ),
    );
  }
}
