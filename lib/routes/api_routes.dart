class ApiRoutes {
  static const String host = '192.168.1.77:3000';
  static const String baseUrl = 'http://$host/api';
  static const String login = '$baseUrl/login';
  static const String singIn = '$baseUrl/users';
  static String getUserInfo(int id) => '$baseUrl/users/$id';
}
