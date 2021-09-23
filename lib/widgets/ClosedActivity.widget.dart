import 'package:fitsim/utils/helpers/route.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClosedActivityWidget extends StatelessWidget {
  const ClosedActivityWidget({
    Key? key,
    required this.dateTime,
    required this.distance,
    required this.onTap,
  }) : super(key: key);

  final DateTime dateTime;
  final String distance;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: height * 0.1,
          width: width * 0.9,
          child: Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(10.0)),
                depth: 2,
                // lightSource: LightSource.topLeft,
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height * 0.1,
                    width: width * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: GoogleMap(
                        mapToolbarEnabled: false,
                        compassEnabled: false,
                        myLocationEnabled: false,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        trafficEnabled: false,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(45.82915702552036, 14.637148381169336),
                          zoom: 10.0,
                        ),
                        polylines: routes.routes,
                        // markers: createMarkers,
                      ),
                    ),
                  ),
                  Text(
                    '${dateTime.day}.${dateTime.month}.${dateTime.year}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.oxygen().fontFamily,
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${dateTime.hour}:${dateTime.minute}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.oxygen().fontFamily,
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    distance,
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
          ),
        ),
      ),
    );
  }
}
