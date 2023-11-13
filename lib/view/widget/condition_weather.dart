
// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_perkiraan_cuaca/constants.dart';

// ignore: must_be_immutable
class ConditionWeather extends StatelessWidget {
  String? number;
  String pathImage;
  double? sizeImage;
  String? status;
   ConditionWeather({Key? key,this.number='',this.pathImage='default',this.sizeImage=0,this.status='hh:mm'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Image(
        width: sizeImage,

        height: 19, //160
        image: AssetImage('assets/images/$pathImage.png'),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        number!,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: K.fontFamily),
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        status!,
        style: const TextStyle(
            color: Color(0xFF69B5FF),
            fontSize: 10,
            fontWeight: FontWeight.w500,
            fontFamily: K.fontFamily),
      ),
    ],
  );

  }
}
