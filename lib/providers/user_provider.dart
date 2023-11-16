import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:global_eats/models/buyInfo.dart';
import 'package:global_eats/models/ticket.dart';
import 'package:global_eats/routes/api_routes.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/utils/logger.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    if (Preferences.jwt != null) {
      fetchUserData();
      fetchTickets();
    }
  }
  User? _user;
  User? get user => _user;
  final List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;
  final Map<String, String> _headers = {'Content-Type': 'application/json'};

  Map<String, List<Product>> products = {};

  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    const url = ApiRoutes.login;
    String body = jsonEncode({
      'email': email,
      'password': password,
    });
    final respose =
        await http.post(Uri.parse(url), headers: _headers, body: body);
    if (respose.statusCode != 200) return false;
    final json = jsonDecode(respose.body);
    _user = User.fromJson(json['user']);
    Preferences.jwt = json['jwt'];
    Preferences.userId = _user!.id.toString();
    return true;
  }

  Future<void> fetchUserData() async {
    final url = ApiRoutes.getUserInfo(int.parse(Preferences.userId!));
    final respose = await http.get(Uri.parse(url), headers: _headers);
    if (respose.statusCode != 200) {
      throw Exception('errror');
    }
    final json = jsonDecode(respose.body);
    _user = User.fromJson(json);
    notifyListeners();
  }

  Future<bool> logout() async {
    Preferences.remove('jwt');
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  Future<bool> registroUsuario(Map<String, dynamic> usuario) async {
    const url = ApiRoutes.singIn;
    String body = jsonEncode(usuario);
    final respose =
        await http.post(Uri.parse(url), headers: _headers, body: body);
    if (respose.statusCode != 200) {
      Loggerify.debug(respose.body);
      throw Exception('error');
    }
    return true;
  }

  Future<bool> updateInfo(var newUser, {String? newPassword}) async {
    final url = ApiRoutes.getUserInfo(newUser.id);
    String body = jsonEncode(newUser.toJson());
    final respose =
        await http.put(Uri.parse(url), headers: _headers, body: body);
    if (respose.statusCode != 200) {
      return false;
    }

    notifyListeners();
    return true;
  }

  Future<bool> changePassword(String newPassword) async {
    return true;
  }

  Future<bool> fetchTickets() async {
    final uri =
        Uri.parse(ApiRoutes.getUserTiket(int.parse(Preferences.userId!)));
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode != 200) {
      return false;
    }
    final json = jsonDecode(response.body);
    Loggerify.debug(json.toString());
    _tickets.clear();
    for (var element in json['ticket']) {
      _tickets.add(Ticket.fromJson(element));
    }
    reduceTicket(_tickets);
    notifyListeners();
    return true;
  }

  String getFecha(DateTime fecha) {
    String fechaString = '${fecha.day}-${fecha.month}-${fecha.year}';
    return fechaString;
  }

  void reduceTicket(List<Ticket> tickets) {
    products.clear();
    for (Ticket element in tickets) {
      final fecha = getFecha(element.createdAt);
      if (!products.containsKey(fecha)) {
        products[fecha] = element.products;
      } else {
        products[fecha]!.addAll(element.products);
      }
    }
  }

  Future<bool> buy(List<BuyModel> productsInfo) async {
    final uri = Uri.parse(ApiRoutes.buy);
    final products = productsInfo.map((e) => e.toJson()).toList();
    final body = jsonEncode(
        {"userId": int.parse(Preferences.userId!), "products": products});
    Loggerify.debug(body.toString());
    final response = await http.post(uri, headers: _headers, body: body);
    Loggerify.debug(response.toString());
    //! reducir estok
    return response.statusCode == 200;
  }
}
