class ApiRoutes {
  static const String host = 'fb51t1xn-3000.use.devtunnels.ms';
  static const String baseUrl = 'https://$host/api';
  static const String login = '$baseUrl/login';
  static const String singIn = '$baseUrl/users';
  static const String products = '$baseUrl/products';
  static const String categories = '$baseUrl/categories';

  static String getUserInfo(int id) => '$baseUrl/users/$id';
}
