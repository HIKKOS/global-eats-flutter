import 'package:flutter/material.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/views/category_view.dart';
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
    _editarCorreo: (_) => const EditarCorreoView(),
    _editarPassword: (_) => const EditarPasswordView(),
    _editarTelefono: (_) => const EditarTelefonoView(),
    _editarNombre: (_) => const EditarNombreView(),
    _buyProduct: (_) => const BuyProductView(),
    _productsByCategory: (_) => const CategoryView(),
    _searchPage: (_) => const SearchPageView(),
    _addresses: (_) => const AdressView(),
  };

  static get routes => _routes;

  static const String _home = 'home';
  static String get home => _home;

  //route: searchPage
  static const String _searchPage = 'search';
  static String get searchPage => _searchPage;

  //route: addresses
  static const String _addresses = 'addresses';
  static String get addresses => _addresses;

  ///route: login
  static const String _login = 'login';
  static String get login => _login;

  static const String _shoppingCart = 'shoppingCart';
  static String get shoppingCart => _shoppingCart;

  ///route: detallesProducto
  static const String _detallesProducto = 'detallesProducto';
  static String get detallesProducto => _detallesProducto;

  //route: compraProducto
  static const String _buyProduct = 'buyProduct';
  static String get buyProduct => _buyProduct;

  ///route: singIn
  static const String _singIn = 'singIn';
  static String get singIn => _singIn;

  static const String _editarCorreo = 'editarCorreo';

  ///route: editarCorreo
  static String get editarCorreo => _editarCorreo;

  static const String _editarPassword = 'editarPassword';

  ///route: editarPassword
  static String get editarPassword => _editarPassword;

  static const String _editarTelefono = 'editarTelefono';

  ///route: editarTelefono
  static String get editarTelefono => _editarTelefono;

  static const String _editarNombre = 'editarNombre';

  ///route: editarNombre
  static String get editarNombre => _editarNombre;

  ///route: productsByCategory
  static const String _productsByCategory = 'productsByCategory';
  static String get productsByCategory => _productsByCategory;
}
