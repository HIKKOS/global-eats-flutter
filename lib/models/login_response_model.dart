import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final int id;
  final String uuid;
  final String correo;
  final String nombre;
  final List<Licencia> licencias;

  LoginResponse({
    required this.id,
    required this.uuid,
    required this.correo,
    required this.nombre,
    required this.licencias,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["id"],
        uuid: json["uuid"],
        correo: json["correo"],
        nombre: json["nombre"],
        licencias: List<Licencia>.from(
            json["licencias"].map((x) => Licencia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "correo": correo,
        "nombre": nombre,
        "licencias": List<dynamic>.from(licencias.map((x) => x.toJson())),
      };
}

class Licencia {
  final int id;
  final String tipoLicenciaId;
  final int usuarioLicenciaId;
  final bool estatus;
  final String uuid;
  final String factura;

  Licencia({
    required this.id,
    required this.tipoLicenciaId,
    required this.usuarioLicenciaId,
    required this.estatus,
    required this.uuid,
    required this.factura,
  });

  factory Licencia.fromJson(Map<String, dynamic> json) => Licencia(
        id: json["id"],
        tipoLicenciaId: json["tipo_licencia_id"],
        usuarioLicenciaId: json["usuario_licencia_id"],
        estatus: json["estatus"],
        uuid: json["uuid"],
        factura: json["factura"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo_licencia_id": tipoLicenciaId,
        "usuario_licencia_id": usuarioLicenciaId,
        "estatus": estatus,
        "uuid": uuid,
        "factura": factura,
      };
}
