import 'dart:convert';

import 'models.dart';

LicenciaResponse licenciaResponseFromJson(String str) =>
    LicenciaResponse.fromJson(json.decode(str));

String licenciaResponseToJson(LicenciaResponse data) =>
    json.encode(data.toJson());

class LicenciaResponse {
  final int id;
  final String uuid;
  final String correo;
  final String nombre;
  final List<Licencia> licencias;

  LicenciaResponse({
    required this.id,
    required this.uuid,
    required this.correo,
    required this.nombre,
    required this.licencias,
  });

  factory LicenciaResponse.fromJson(Map<String, dynamic> json) =>
      LicenciaResponse(
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
