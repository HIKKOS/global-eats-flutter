import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:global_eats/models/catergory.dart';
import 'package:global_eats/routes/api_routes.dart';
import 'package:global_eats/utils/enums.dart';
import 'package:http/http.dart' as http;

class CategoriesProvider extends ChangeNotifier {
  List<Category> _categories = [];
  List<Category> get categories => _categories;
  ProviderState _state = ProviderState.loading;
  ProviderState get state => _state;
  Future<List<Category>> fetchCategories() async {
    final url = Uri.parse(ApiRoutes.categories);
    final json = jsonDecode((await http.get(url)).body);
    final List<Category> categories = [];
    for (var item in json['categories']) {
      categories.add(Category.fromJson(item));
    }
    _categories = categories;
    _state = categories.isEmpty ? ProviderState.empty : ProviderState.success;
    notifyListeners();
    return categories;
  }
}
