import 'dart:convert';

List<UserM> userMFromJson(String str) =>
    List<UserM>.from(json.decode(str).map((x) => UserM.fromJson(x)));

String userMToJson(List<UserM> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserM {
  UserM({
    this.id,
    this.username,
    this.name,
    this.email,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.password,
    this.image,
    this.address,
    this.phone,
  });

  int? id;
  String? username;
  String? name;
  String? email;
  String? password;
  int? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  String? address;
  String? phone;

  factory UserM.fromJson(Map<String, dynamic> json) => UserM(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        image: json["image"] ?? '',
        address: json["address"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "email": email,
        "role": role,
        "image": image,
        "address": address,
        "created_at": createdAt?.toIso8601String() ?? DateTime.now(),
        "updated_at": updatedAt?.toIso8601String() ?? DateTime.now(),
      };

  factory UserM.fromJsonSignup(Map<String, dynamic> json) => UserM(
        email: json["email"],
        username: json["username"],
        password: json["password"],
        role: json["role"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJsonSignup() => {
        "username": username,
        "name": name,
        "email": email,
        "role": role,
        "image": image,
        "address": address,
      };
}
