import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/routes.dart';

List<String> townItems = <String>['jddjj', 'dkkdkd',];
class LocationSettingScreen extends StatefulWidget {
  const LocationSettingScreen({Key? key}) : super(key: key);

  @override
  State<LocationSettingScreen> createState() => _LocationSettingScreenState();
}

class _LocationSettingScreenState extends State<LocationSettingScreen> {
  @override
  Widget build(BuildContext context) {

    String items = townItems.first;
    return Scaffold(


appBar: AppBar(

),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              DropdownButton<String>(


                  items: townItems.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem(
alignment:AlignmentDirectional.bottomCenter ,
                    value: value,

                    child: Center(child: Text(value, style: TextStyle(color: Colors.black),)));
              }).toList() , onChanged: (String? value){
               setState(() {
                 items = value!;
               });
              },

                isExpanded: true,
                isDense: true,
                elevation: 0,
                borderRadius: BorderRadius.circular(20),
                padding: EdgeInsets.all(40),
                dropdownColor: Colors.black,
                  enableFeedback: true,

                alignment: AlignmentDirectional.bottomCenter,

              ),
              TextButton(
                  onPressed: () => context.go(Routes.settingRoute),
                  child: ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                    return Text('djdj');
                  }),

              ),

            ],
          ),
        ),
      ),
    );
  }
}



//
// /// Flutter code sample for [DropdownButton].
//
// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
//
// void main() => runApp(const DropdownButtonApp());
//
// class DropdownButtonApp extends StatelessWidget {
//   const DropdownButtonApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('DropdownButton Sample')),
//         body: const Center(
//           child: DropdownButtonExample(),
//         ),
//       ),
//     );
//   }
// }

// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});
//
//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }
//
// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   String dropdownValue = list.first;
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
