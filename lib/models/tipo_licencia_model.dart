class TipoLicencia {
  final int id;
  final String descripcion;
  final List<int> modulos;

  TipoLicencia({
    required this.id,
    required this.descripcion,
    required this.modulos,
  });

  factory TipoLicencia.fromJson(Map<String, dynamic> json) => TipoLicencia(
        id: json["id"],
        descripcion: json["descripcion"],
        modulos: List<int>.from(json["modulos"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "modulos": List<dynamic>.from(modulos.map((x) => x)),
      };
}
