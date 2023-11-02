import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _preferences;
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String get servidor => _preferences?.getString('servidor') ?? '';
  static set servidor(String servidor) =>
      _preferences?.setString('servidor', servidor);

  static String? get userId => _preferences?.getString('userId');
  static set userId(String? userId) =>
      _preferences?.setString('userId', userId!);

  static String? get jwt => _preferences?.getString('jwt');
  static set jwt(String? jwt) => _preferences?.setString('jwt', jwt!);

  static bool get isUserLogged => _preferences?.getBool('isLogged') ?? false;

  static set isUserLogged(bool value) =>
      _preferences?.setBool('isLogged', value);

  static bool get isDarkMode => _preferences?.getBool('isDark') ?? false;
  static set isDarkMode(bool value) => _preferences?.setBool('isDark', value);
  static remove(String key) => _preferences?.remove(key);
}
