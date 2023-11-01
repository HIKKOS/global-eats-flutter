import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _preferences;
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String get servidor => _preferences?.getString('servidor') ?? '';
  static set servidor(String servidor) =>
      _preferences?.setString('servidor', servidor);

  static bool get isUserLogged => _preferences?.getBool('isLogged') ?? false;

  static set isUserLogged(bool value) =>
      _preferences?.setBool('isLogged', value);

  static bool get isDarkMode => _preferences?.getBool('isDark') ?? false;
  static set isDarkMode(bool value) => _preferences?.setBool('isDark', value);
}
