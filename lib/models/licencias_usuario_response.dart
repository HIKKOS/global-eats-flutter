import 'dart:convert';

import 'models.dart';

LicenciasDeUsuario licenciasDeUsuarioFromJson(String str) =>
    LicenciasDeUsuario.fromJson(json.decode(str));

String licenciasDeUsuarioToJson(LicenciasDeUsuario data) =>
    json.encode(data.toJson());

class LicenciasDeUsuario {
  final int id;
  final String uuid;
  final String correo;
  final String nombre;
  final List<Licencia> licencias;

  LicenciasDeUsuario({
    required this.id,
    required this.uuid,
    required this.correo,
    required this.nombre,
    required this.licencias,
  });

  factory LicenciasDeUsuario.fromJson(Map<String, dynamic> json) =>
      LicenciasDeUsuario(
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
