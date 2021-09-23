import 'package:fitsim/screens/activity.screen.dart';
import 'package:fitsim/screens/home.screen.dart';
import 'package:fitsim/screens/login.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        LoginPage.routeName: (context) => const LoginPage(),
        ActivityScreen.routeName: (context) => const ActivityScreen(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}