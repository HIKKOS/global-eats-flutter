import 'package:flutter/material.dart';
import 'package:global_eats/views/views.dart';

class AppRoutes {
  static const String _initialRoute = _login;
  static String get initialRoute => _initialRoute;

  static final Map<String, Widget Function(BuildContext)> _routes = {
    _home: (_) => const HomeView(),
    _login: (_) => const LoginView(),
  };

  static get routes => _routes;

  static const String _home = 'activarLicencia';
  static String get home => _home;

  ///route: login
  static const String _login = 'login';
  static String get login => _login;
}
