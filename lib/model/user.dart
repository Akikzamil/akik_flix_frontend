import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String name;
  final String phone;
  final String password;

  User({required this.name, required this.phone, required this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "password": password,
  };

  factory User.fromOtp(String phone,String countryCode, password) => User(
        name: "",
        phone: countryCode + phone,
        password: password,
      );
}
