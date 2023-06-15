import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:united102/src/presentation/widgets/header_widget.dart';

class ServiceDescriptionScreen extends StatefulWidget {
  const ServiceDescriptionScreen({Key? key}) : super(key: key);

  @override
  State<ServiceDescriptionScreen> createState() =>
      _ServiceDescriptionScreenState();
}

class _ServiceDescriptionScreenState extends State<ServiceDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              HeaderWidget(title: 'Операция по корпаротивному счету'),
              SizedBox(height: 20,),
              DescriptionService()
            ],
          ),
        ),
      ),
    );
  }
}


class DescriptionService extends StatelessWidget {
  const DescriptionService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        'Операции по корпоративному счету включают финансовые транзакции: открытие/закрытие счета, банковские переводы, операции с валютой, платежи, документы.',

      style: GoogleFonts.montserrat(
textStyle: TextStyle(
  color: Color.fromRGBO(0, 0, 0, 0.6),
  fontWeight: FontWeight.w400,

)
    ),);
  }
}

