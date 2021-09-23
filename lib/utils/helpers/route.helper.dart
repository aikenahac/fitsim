import 'package:fitsim/utils/constants/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_routes/google_maps_routes.dart';
import 'package:fitsim/utils/keys.dart';

MapsRoutes routes = MapsRoutes();

Future<void> drawActivityRoute(List<LatLng> _points) async {
  await routes.drawRoute(
    _points,
    'Activity',
    FitSimColors.purple,
    Keys.googleApiKey,
    travelMode: TravelModes.walking,
  );
}

String getDistance(List<LatLng> _points) {
  DistanceCalculator distanceCalculator = DistanceCalculator();

  return distanceCalculator.calculateRouteDistance(_points);
}
