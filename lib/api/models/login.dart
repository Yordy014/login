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
    this.person,
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
  Person person;

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
        person: Person.fromJson(json["PERSON"]),
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
        "PERSON": person.toJson(),
      };
}

class Person {
  Person({
    this.idPerson,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.telNumber,
    this.address,
  });

  String idPerson;
  String firstName;
  String lastName;
  DateTime birthDate;
  String telNumber;
  String address;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        idPerson: json["ID_PERSON"],
        firstName: json["FIRST_NAME"],
        lastName: json["LAST_NAME"],
        birthDate: DateTime.parse(json["BIRTH_DATE"]),
        telNumber: json["TEL_NUMBER"],
        address: json["ADDRESS"],
      );

  Map<String, dynamic> toJson() => {
        "ID_PERSON": idPerson,
        "FIRST_NAME": firstName,
        "LAST_NAME": lastName,
        "BIRTH_DATE":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "TEL_NUMBER": telNumber,
        "ADDRESS": address,
      };
}
