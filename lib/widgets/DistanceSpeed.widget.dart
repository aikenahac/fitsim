import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class DistanceSpeedWidget extends StatelessWidget {
  const DistanceSpeedWidget({
    Key? key,
    required this.distance,
    required this.avgSpeed,
  }) : super(key: key);

  final String distance;
  final String avgSpeed;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.375,
      height: height * 0.12,
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10.0)),
          depth: 8,
          lightSource: LightSource.topLeft,
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Distance: $distance',
              style: TextStyle(
                fontFamily: GoogleFonts.oxygen().fontFamily,
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3.0,),
            Text(
              'Avg.: $avgSpeed',
              style: TextStyle(
                fontFamily: GoogleFonts.oxygen().fontFamily,
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
