// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.ok,
    this.user,
    this.token,
  });

  bool ok;
  User user;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        ok: json["ok"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.idUser,
    this.email,
    this.username,
    this.isEmployee,
    this.verified,
    this.idPerson,
    this.idDepartment,
    this.isActive,
    this.active,
    this.role,
  });

  String idUser;
  String email;
  String username;
  bool isEmployee;
  bool verified;
  String idPerson;
  String idDepartment;
  bool isActive;
  bool active;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["ID_USER"],
        email: json["EMAIL"],
        username: json["USERNAME"],
        isEmployee: json["IS_EMPLOYEE"],
        verified: json["VERIFIED"],
        idPerson: json["ID_PERSON"],
        idDepartment: json["ID_DEPARTMENT"],
        isActive: json["is_active"],
        active: json["ACTIVE"],
        role: json["ROLE"],
      );

  Map<String, dynamic> toJson() => {
        "ID_USER": idUser,
        "EMAIL": email,
        "USERNAME": username,
        "IS_EMPLOYEE": isEmployee,
        "VERIFIED": verified,
        "ID_PERSON": idPerson,
        "ID_DEPARTMENT": idDepartment,
        "is_active": isActive,
        "ACTIVE": active,
        "ROLE": role,
      };
}
