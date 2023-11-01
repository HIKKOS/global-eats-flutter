import 'package:flutter/material.dart';
import 'package:global_eats/views/home_view.dart';

class AppRoutes {
  static const String _initialRoute = _home;
  static String get initialRoute => _initialRoute;

  static final Map<String, Widget Function(BuildContext)> _routes = {
    _home: (_) => const HomeView(),
  };

  static get routes => _routes;

  static const String _home = 'activarLicencia';
  static String get home => _home;
}
