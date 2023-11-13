
import 'package:flutter/material.dart';
import 'package:flutter_perkiraan_cuaca/constants.dart';

class DegreeWidget extends StatelessWidget {
  final int size;
  const DegreeWidget({
    Key? key,required this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: K.width * size-1,
      height: K.height*size,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: K.width*4),
        shape: BoxShape.circle,
      ),
    );
  }
}
