import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBadgeWidget extends StatelessWidget {
  int index;
   IconBadgeWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String > _iconsPath = [
      'assets/icons/fiz_face.svg',
      'assets/icons/your_face.svg',
      'assets/icons/buy_card.svg'
    ];
    return  Container(
      height: 45,
      width: 45,
      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(188, 225, 248, 1.0),
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
              child: SvgPicture.asset(_iconsPath[index]),
            ),
          ),
        ),
      ),
    );
  }
}

