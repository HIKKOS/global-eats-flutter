class ApiRoutes {
  static const String host = '10.1.100.201:3000';
  static const String baseUrl = 'http://$host/api';
  static const String login = '$baseUrl/login';
  static const String singIn = '$baseUrl/users';
  static const String buy = '$baseUrl/buy';
  static const String products = '$baseUrl/products';
  static const String categories = '$baseUrl/categories';
  static String getUserInfo(int id) => '$baseUrl/users/$id';
  static String getUserTiket(int id) =>
      '$baseUrl/ticket/user/$id?page=1&limit=1000';
}
