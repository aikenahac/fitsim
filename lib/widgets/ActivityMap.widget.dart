import 'package:fitsim/utils/helpers/route.helper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ActivityMap extends StatefulWidget {
  const ActivityMap({
    Key? key,
    required this.points,
    required this.createMarkers,
  }) : super(key: key);

  final List<LatLng> points;
  final Set<Marker> createMarkers;

  @override
  State<ActivityMap> createState() => _ActivityMapState();
}

class _ActivityMapState extends State<ActivityMap> {
  void _renderRoute() async {
    await drawActivityRoute(
      widget.points,
    );
  }

  @override
  void initState() {
    super.initState();
    _renderRoute();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4.0,
            offset: const Offset(0, 4.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: GoogleMap(
          mapToolbarEnabled: false,
          compassEnabled: false,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          trafficEnabled: false,
          initialCameraPosition: CameraPosition(
            target: widget.points.first,
            zoom: 15.0,
          ),
          polylines: routes.routes,
          markers: widget.createMarkers,
        ),
      ),
    );
  }
}
