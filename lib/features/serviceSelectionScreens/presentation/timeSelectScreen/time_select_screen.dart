// import 'package:flutter/material.dart';
// import 'package:united102/app/routes/routes.dart';
// import 'package:united102/features/pageListScreens/presentation/widgets/header_text_widget.dart';
// import 'package:united102/features/widgets/screen_switcher_button.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';
// class TimeSelectScreen extends StatefulWidget {
//   const TimeSelectScreen({Key? key}) : super(key: key);
//
//   @override
//   State<TimeSelectScreen> createState() => _TimeSelectScreenState();
// }
//
// class _TimeSelectScreenState extends State<TimeSelectScreen> {
//
//   Future<void> _showDateTimePicker(BuildContext context) async {
//     final TimeOfDay initialTime = TimeOfDay(hour: 10, minute: 0);
//     final TimeOfDay selectedTime = await showTimePicker(
//       context: context,
//       initialTime: initialTime,
//       builder: (BuildContext context, Widget? child) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
//           child: child!,
//         );
//       },
//     );
//
//     if (selectedTime != null) {
//       final DateTime now = DateTime.now();
//       final DateTime selectedDateTime = DateTime(
//         now.year,
//         now.month,
//         now.day,
//         selectedTime.hour,
//         selectedTime.minute,
//       );
//
//       setState(() {
//         this.selectedDateTime = selectedDateTime;
//       });
//   @override
//   Widget build(BuildContext context) {
//     DateTime date = DateTime.now();
//
//
//
//
//     DateTime dateTime = DateTime.now();
//     String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
//
//     DateTime timeDate  = DateTime.now();
//     String formattedTime = DateFormat('HH:mm:ss').format(timeDate);
//
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DateTimePicker'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 _showDateTimePicker(context);
//               },
//               child: Text('Выбрать время'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Выбранное время: ${DateFormat('HH:mm').format(selectedDateTime)}',
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }
//
import 'package:flutter/material.dart';
import 'package:united102/features/reservationScreens/presentation/screens/DataEntryScreen/data_entry_screen.dart';

class TimeSelectScreen extends StatelessWidget {
  int queue;

  TimeSelectScreen({Key? key, required this.queue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DataEntryScreen(queue: queue, data: 'data', time: 'time')));
            },
            child: const Text('print')),
      ),
    );
  }
}
