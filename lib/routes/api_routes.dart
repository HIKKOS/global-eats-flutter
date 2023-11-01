class ApiRoutes {
  static const String baseUrl = 'localhost:3000/api/';
  static const String login = '$baseUrl/login';
  static const String singIn = '$baseUrl/users';
  static String getUpdateUserInfo(int id) => '$baseUrl/users/%$id';
}
