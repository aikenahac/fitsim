import 'package:fitsim/widgets/ActivityMap.widget.dart';
import 'package:fitsim/widgets/DistanceSpeed.widget.dart';
import 'package:fitsim/widgets/Duration.widget.dart';
import 'package:fitsim/widgets/TopBar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fitsim/utils/helpers/route.helper.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  static const String routeName = '/activity';

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late int _id;

  BitmapDescriptor? _startIcon;
  BitmapDescriptor? _finishIcon;

  final DateTime _startTime = DateTime.now();
  final DateTime _endTime = DateTime.now().add(const Duration(hours: 2));

  final String _distance = '69 km';
  final String _avgSpeed = '5.5 km/h';

  @override
  void initState() {
    getActivity();
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(48, 48)),
            'assets/start_point.png')
        .then((value) => _startIcon = value);
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(48, 48)),
            'assets/finish_point.png')
        .then((value) => _finishIcon = value);
    super.initState();
  }

  final List<LatLng> _points = [
    const LatLng(45.82915702552036, 14.637148381169336),
    const LatLng(45.85972767704212, 14.652782350496182),
  ];

  void getActivity() {}

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('Start'),
        position: _points.first,
        icon: _startIcon ?? BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('Start'),
        position: _points.last,
        icon: _finishIcon ?? BitmapDescriptor.defaultMarker,
      ),
    };

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ActivityArguments;
    setState(() {
      _id = args.id;
    });
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: width,
        child: Stack(
          children: [
            ActivityMap(
              points: _points,
              createMarkers: _createMarkers(),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: TopBar(),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DurationWidget(
                      startTime: _startTime,
                      endTime: _endTime,
                    ),
                    const SizedBox(width: 20.0),
                    DistanceSpeedWidget(
                      distance: _distance,
                      avgSpeed: _avgSpeed,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityArguments {
  final int id;

  ActivityArguments(this.id);
}
