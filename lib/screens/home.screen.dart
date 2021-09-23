import 'package:fitsim/screens/activity.screen.dart';
import 'package:fitsim/utils/keys.dart';
import 'package:fitsim/widgets/ClosedActivity.widget.dart';
import 'package:fitsim/widgets/TopBar.widget.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_widget/open_weather_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/';

  void _navigateToActivity(BuildContext context, int id) {
    Navigator.pushNamed(
      context,
      ActivityScreen.routeName,
      arguments: ActivityArguments(id),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const TopBar(),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 180,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0.0, 10.0),
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: OpenWeatherWidget(
                        latitude: 46.04886799468411,
                        longitude: 14.503375230410997,
                        location: "Ljubljana",
                        height: 180,
                        width: width * 0.9,
                        apiKey: Keys.owmApiKey,
                        alignment: MainAxisAlignment.center,
                        margin: const EdgeInsets.all(10.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              children: [
                ClosedActivityWidget(
                  dateTime: DateTime.now(),
                  distance: '69 km',
                  onTap: () {
                    _navigateToActivity(context, 1);
                  },
                ),
                ClosedActivityWidget(
                  dateTime: DateTime.now(),
                  distance: '69 km',
                  onTap: () {
                    _navigateToActivity(context, 1);
                  },
                ),
                ClosedActivityWidget(
                  dateTime: DateTime.now(),
                  distance: '69 km',
                  onTap: () {
                    _navigateToActivity(context, 1);
                  },
                ),
                ClosedActivityWidget(
                  dateTime: DateTime.now(),
                  distance: '69 km',
                  onTap: () {
                    _navigateToActivity(context, 1);
                  },
                ),
                ClosedActivityWidget(
                  dateTime: DateTime.now(),
                  distance: '69 km',
                  onTap: () {
                    _navigateToActivity(context, 1);
                  },
                ),
                ClosedActivityWidget(
                  dateTime: DateTime.now(),
                  distance: '69 km',
                  onTap: () {
                    _navigateToActivity(context, 1);
                  },
                ),
                ClosedActivityWidget(
                  dateTime: DateTime.now(),
                  distance: '69 km',
                  onTap: () {
                    _navigateToActivity(context, 1);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/*
OpenWeatherWidget(
  latitude: 46.04886799468411,
  longitude: 14.503375230410997,
  location: "Ljubljana",
  height: 180,
  width: width * 0.9,
  apiKey: Keys.owmApiKey,
  alignment: MainAxisAlignment.center,
  margin: const EdgeInsets.all(10.0),
),


ClosedActivityWidget(
  dateTime: DateTime.now(),
  distance: '69 km',
  onTap: () {
    _navigateToActivity(context, 1);
  },
),
*/