import 'package:flutter/material.dart';
import 'package:test_ws/presentation/onboard.dart';

abstract class NavigateRoute {
  static const initialRoute = '/';
}

class NavigateService {
  final initialroute = NavigateRoute.initialRoute;

  final routes = <String, Widget Function(BuildContext)>{
    NavigateRoute.initialRoute: (context) => const OnBoard()
  };
}
