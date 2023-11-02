import 'package:flutter/material.dart';
import 'package:global_eats/views/views.dart';
import '../views/shopping_cart_view.dart';

class AppRoutes {
  static const String _initialRoute = _login;
  static String get initialRoute => _initialRoute;

  static final Map<String, Widget Function(BuildContext)> _routes = {
    _home: (_) => const HomeView(),
    _login: (_) => const LoginView(),
    _shoppingCart: (_) => const ShoppingCartView(),
  };

  static get routes => _routes;

  static const String _home = 'activarLicencia';
  static String get home => _home;

  ///route: login
  static const String _login = 'login';
  static String get login => _login;

  static const String _shoppingCart = 'shoppingCart';
  static String get shoppingCart => _shoppingCart;
}
