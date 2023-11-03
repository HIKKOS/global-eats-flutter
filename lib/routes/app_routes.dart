import 'package:flutter/material.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/views/producto_view.dart';
import 'package:global_eats/views/registro_view.dart';
import 'package:global_eats/views/views.dart';
import '../views/shopping_cart_view.dart';

class AppRoutes {
  static final String _initialRoute = Preferences.jwt == null ? _login : _home;
  static String get initialRoute => _initialRoute;

  static final Map<String, Widget Function(BuildContext)> _routes = {
    _home: (_) => const MainView(),
    _login: (_) => const LoginView(),
    _shoppingCart: (_) => const ShoppingCartView(),
    _detallesProducto: (_) => const ProductoView(),
    _singIn: (_) => const RegistroView(),
  };

  static get routes => _routes;

  static const String _home = 'home';
  static String get home => _home;

  ///route: login
  static const String _login = 'login';
  static String get login => _login;

  static const String _shoppingCart = 'shoppingCart';
  static String get shoppingCart => _shoppingCart;

  ///route: detallesProducto
  static const String _detallesProducto = 'detallesProducto';
  static String get detallesProducto => _detallesProducto;

  ///route: singIn
  static const String _singIn = 'singIn';
  static String get singIn => _singIn;
}
