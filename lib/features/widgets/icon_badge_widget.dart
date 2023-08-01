import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class IconBadgeWidget extends StatelessWidget {
  int index;
   IconBadgeWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String > iconsPath = [
      'assets/icons/fiz_face.svg',
      'assets/icons/your_face.svg',
      'assets/icons/buy_card.svg'
    ];
    return  Container(
      height: 45,
      width: 45,
      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(188, 225, 248, 1),
          borderRadius: BorderRadius.circular(14)
      ),
      child: Center(
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 18.29,
              width: 22.86,
              child: SvgPicture.asset(iconsPath[index]),
            ),
          ),
        ),
      ),
    );
  }
}


class LocationIcon extends StatelessWidget {

 const LocationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Container(
      height: 45,
      width: 45,
      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(188, 225, 248, 1),
          borderRadius: BorderRadius.circular(14)
      ),
      child: Center(
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromRGBO(255, 255, 255, 1)
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 7,
              width: 6,
              child: SvgPicture.asset('assets/setting_icons/map.svg'),
            ),
          ),
        ),
      ),
    );
  }
}


