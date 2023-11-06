import 'dart:convert';

User licenciasDeUsuarioFromJson(String str) => User.fromJson(json.decode(str));

String licenciasDeUsuarioToJson(User data) => json.encode(data.toJson());

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final bool status;
  final Role role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.status,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        status: json["status"],
        role: Role.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "status": status,
        "role": role.toJson(),
      };

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    bool? status,
    Role? role,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        status: status ?? this.status,
        role: role ?? this.role,
      );
}

class Role {
  final int id;
  final String rolName;
  final bool status;

  Role({
    required this.id,
    required this.rolName,
    required this.status,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        rolName: json["rolName"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rolName": rolName,
        "status": status,
      };
}
