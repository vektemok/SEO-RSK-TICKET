import 'package:flutter/material.dart';

class LocationSelectScreen extends StatefulWidget {
  const LocationSelectScreen({Key? key}) : super(key: key);

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(itemBuilder: (context, index) {
              return Center(
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 199, minHeight: 199)),
              );
            })
          ],
        ),
      ),
    );
  }
}
