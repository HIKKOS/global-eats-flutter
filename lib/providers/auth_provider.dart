import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:global_eats/routes/api_routes.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  //UsuarioProvider() : _user = ;

  // UsuarioLealtad? _user;
  // UsuarioLealtad? get user => _user;

  final Map<String, String> _headers = {'Content-Type': 'application/json'};

/*   set user(UsuarioLealtad? value) {
    _user = value;
    notifyListeners();
  } */

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    const url = ApiRoutes.login;
    String body = jsonEncode({
      'enail': email,
      'password': password,
    });
    final respose =
        await http.post(Uri.parse(url), headers: _headers, body: body);
    if (respose.statusCode != 200) return false;
    //final user = UsuarioLogin.fromJson(jsonDecode(respose.body));
    return respose.statusCode == 200;
  }

  Future<bool> logout() async {
    //Preferences.
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  Future<bool> registroUsuario(Map<String, dynamic> usuario) async {
    const url = ApiRoutes.singIn;
    String body = jsonEncode(usuario);
    final respose =
        await http.post(Uri.parse(url), headers: _headers, body: body);
    if (respose.statusCode != 200) {
      throw Exception('errror');
    }
    return true;
  }

  Future<bool> updateInfo(var newUser, {String? newPassword}) async {
    final url = ApiRoutes.getUpdateUserInfo(newUser.id);
    String body = jsonEncode(newUser.toJson());
    final respose =
        await http.put(Uri.parse(url), headers: _headers, body: body);
    if (respose.statusCode != 200) {
      return false;
    }

    notifyListeners();
    return true;
  }
}
