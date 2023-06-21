import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:united102/app/notifications/ticket_waiting_nofication.dart';
class TimeSelectScreen extends StatefulWidget {
  const TimeSelectScreen({Key? key}) : super(key: key);

  @override
  State<TimeSelectScreen> createState() => _TimeSelectScreenState();
}

class _TimeSelectScreenState extends State<TimeSelectScreen> {

  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: CupertinoDatePicker(
                minimumDate: _dateTime,

                use24hFormat: true,
                  initialDateTime: _dateTime,
                  onDateTimeChanged: (dateTime){
                    setState(() {
                      _dateTime =   dateTime;

                    });
                    print(_dateTime);
                  }),
            ),

            ElevatedButton(onPressed: (){
              pushNotification();
            }, child: Text('pUsh notification'))
          ],
        ),
      ),
    );
  }
}
