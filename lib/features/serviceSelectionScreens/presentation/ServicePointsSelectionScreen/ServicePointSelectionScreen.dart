import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/features/widgets/screen_switcher_button.dart';

class ServicePointSelectionScreen extends StatefulWidget {
  const ServicePointSelectionScreen({Key? key}) : super(key: key);

  @override
  State<ServicePointSelectionScreen> createState() => _ServicePointSelectionScreenState();
}

class _ServicePointSelectionScreenState extends State<ServicePointSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
          child: Column(
            children: [
              Text(
                'Пожалуйста, выберете точку обслуживания',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
           Container(
             width: double.infinity,
             height: 500,
             child: Expanded(child: ListView.builder(
                 itemCount: 10,
                 itemBuilder: (context, index){
               return Container(
                 color: Colors.black,
               );
             })),
           ),
              ScreenSwitcherButton(path: '')
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('');
  }
}
