import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({
    Key? key,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  final DateTime startTime;
  final DateTime endTime;

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
              '${startTime.day}.${startTime.month}.${startTime.year}',
              style: TextStyle(
                fontFamily: GoogleFonts.oxygen().fontFamily,
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(thickness: 2.0,),
            ),
            Text(
              'From: ${startTime.hour}.${startTime.minute}.${startTime.second}',
              style: TextStyle(
                fontFamily: GoogleFonts.oxygen().fontFamily,
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3.0,),
            Text(
              'To: ${endTime.hour}:${endTime.minute}:${endTime.second}',
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
