import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';
import 'package:united102/features/reservationScreens/presentation/screens/DataEntryScreen/data_entry_screen.dart';
import 'package:united102/features/widgets/my_elevated_button.dart';
import 'package:united102/iternal/helpers/style_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSelectScreen extends StatefulWidget {
  final int queue;

  const TimeSelectScreen({super.key, required this.queue});

  @override
  State<TimeSelectScreen> createState() => _TimeSelectScreenState();
}

class _TimeSelectScreenState extends State<TimeSelectScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void selectDateTime() {
    setState(() async {
      selectedDate = (await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2024)))!;
    });
  }

  void selectTime() {
    setState(() async {
      selectedTime = (await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: 10,
          minute: 10,
        ),
      ))!;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);

    String formatTime(TimeOfDay timeOfDay) {
      String formattedTime = timeOfDay.format(context);
      return formattedTime;
    }

    Future<void> saveTime() async {
      if (formattedDate == null || selectedDate == null) {
        SmartDialog.showNotify(
            msg: 'Пожалуйста, выберите дату', notifyType: NotifyType.failure);
        await Future.delayed(const Duration(seconds: 5));
      } else {
        SmartDialog.showLoading(msg: 'Ожидайте');
        await Future.delayed(const Duration(seconds: 2));
        SmartDialog.dismiss();
        Future.delayed(const Duration(milliseconds: 200));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DataEntryScreen(
                      queue: widget.queue,
                      time: '14:30:00',
                      data:formattedDate ,
                    )));
      }
    }

    return Scaffold(
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
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderTextWidget(title: 'Пожалуйста, выберите \n время'),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => selectDateTime(),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 56,
                  width: 339,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5,
                          color: const Color.fromRGBO(157, 157, 157, 1))),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/Vector (9).svg'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Выберите',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16)),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.blue,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => selectTime(),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 56,
                  width: 339,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5,
                          color: const Color.fromRGBO(157, 157, 157, 1))),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/formkit_time.svg'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Выберите',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16)),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.blue,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              MyElevatedButton(
                  onPressed: () => saveTime(), child: const Text('Далее'))
            ],
          ),
        ),
      ),
    );
  }
}
