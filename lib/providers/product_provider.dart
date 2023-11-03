import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:global_eats/models/product.dart';
import 'package:global_eats/routes/api_routes.dart';
import 'package:global_eats/utils/enums.dart';
import 'package:http/http.dart' as http;

class ProductosProvider extends ChangeNotifier {
  List<Product> _productos = [];
  List<Product> get productos => _productos;
  ProviderState _state = ProviderState.loading;
  ProviderState get state => _state;

  late Product _seleccionado;
  Product get seleccionado => _seleccionado;
  set seleccionado(Product producto) {
    _seleccionado = producto;
    notifyListeners();
  }

  Future<List<Product>> fetchProductos() async {
    final url = Uri.parse(ApiRoutes.products);
    final json = jsonDecode((await http.get(url)).body);
    final List<Product> productos = [];
    for (var item in json['products']) {
      productos.add(Product.fromJson(item));
    }
    _productos = productos;
    _state = productos.isEmpty ? ProviderState.empty : ProviderState.success;
    notifyListeners();
    return productos;
  }
}
