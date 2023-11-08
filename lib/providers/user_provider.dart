import 'dart:convert';
import 'package:flutter/widgets.dart';
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
  List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;
  final Map<String, String> _headers = {'Content-Type': 'application/json'};

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
    for (var element in json['ticket']) {
      _tickets.add(Ticket.fromJson(element));
    }
    notifyListeners();
    return true;
  }
}
