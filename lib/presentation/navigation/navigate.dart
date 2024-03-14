import 'package:flutter/material.dart';

import '../pages/Home.dart';
import '../pages/onboard.dart';

abstract class NavigateRoute {
  static const initialRoute = '/';
  static const home = '/Home';
}

class NavigateService {
  final initialroute = NavigateRoute.initialRoute;
  final homeroute = NavigateRoute.home;

  final routes = <String, Widget Function(BuildContext)>{
    NavigateRoute.initialRoute: (context) => const OnBoard(),
    NavigateRoute.home: (context) => const Home(),
  };
}
