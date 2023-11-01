class ApiRoutes {
  static const String _soferpAdmin = "https://www.soferp.com/admin";
  static get soferpAdmin => _soferpAdmin;

  static late String _servidor;
  static set servidor(String value) {
    _servidor = value;
  }

  static const String estadoLicencia =
      "$_soferpAdmin/licencias_usuario/cliente_licencia";
}
