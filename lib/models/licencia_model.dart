import 'models.dart';

class Licencia {
  final String tipoLicenciaId, servidor;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final String uuid;
  final bool activado;
  final dynamic clienteNombre;
  final TipoLicencia tipoLicencia;

  Licencia({
    required this.tipoLicenciaId,
    required this.servidor,
    required this.tipoLicencia,
    required this.clienteNombre,
    required this.fechaInicio,
    required this.fechaFin,
    required this.activado,
    required this.uuid,
  });

  factory Licencia.fromJson(Map<String, dynamic> json) => Licencia(
        tipoLicenciaId: json["tipo_licencia_id"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        uuid: json["uuid"],
        servidor: json["servidor"],
        activado: json["activado"],
        clienteNombre: json["cliente_nombre"],
        tipoLicencia: TipoLicencia.fromJson(json["tipo_licencia"]),
      );

  Map<String, dynamic> toJson() => {
        "tipo_licencia_id": tipoLicenciaId,
        "fecha_inicio": fechaInicio.toIso8601String(),
        "fecha_fin": fechaFin.toIso8601String(),
        "uuid": uuid,
        "activado": activado,
        "servidor": servidor,
        "cliente_nombre": clienteNombre,
        "tipo_licencia": tipoLicencia.toJson(),
      };
}
