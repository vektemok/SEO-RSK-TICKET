import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnifyingHistoryScreen extends StatefulWidget {
  const UnifyingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<UnifyingHistoryScreen> createState() => _UnifyingHistoryScreenState();
}

class _UnifyingHistoryScreenState extends State<UnifyingHistoryScreen> {
  static const List<Tab> ticketTab = [
    Tab(
      text: 'В процессе',
    ),
    Tab(
      text: 'Забронированные',
    ),
    Tab(
      text: 'История',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: ticketTab.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: ticketTab,
              splashBorderRadius: BorderRadius.circular(20),
              labelStyle:
                  GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10,
                      fontWeight: FontWeight.w600
                  )),

              unselectedLabelColor: Colors.black,
              labelColor: Colors.blue,
              indicatorPadding: EdgeInsets.all(8),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent,
                    blurRadius: 2
                  )
                ]
              ),

            ),

          ),
          body: TabBarView(
            children: ticketTab.map((Tab tab) {
              return Center(
                child: Text('У вас пока нет забронированных талонов'),
              );

            }).toList(),
          ),
        ));
  }
}



