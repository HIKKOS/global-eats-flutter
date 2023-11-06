class ApiRoutes {
  static const String host = 'x1m31rf2-3000.usw3.devtunnels.ms';
  static const String baseUrl = 'https://$host/api';
  static const String login = '$baseUrl/login';
  static const String singIn = '$baseUrl/users';
  static const String products = '$baseUrl/products';
  static const String categories = '$baseUrl/categories';

  static String getUserInfo(int id) => '$baseUrl/users/$id';
}
