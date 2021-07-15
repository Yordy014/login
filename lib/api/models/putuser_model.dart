// To parse this JSON data, do
//
//     final putUserModel = putUserModelFromJson(jsonString);

import 'dart:convert';

PutUserModel putUserModelFromJson(String str) =>
    PutUserModel.fromJson(json.decode(str));

String putUserModelToJson(PutUserModel data) => json.encode(data.toJson());

class PutUserModel {
  PutUserModel({
    this.ok,
    this.message,
    this.data,
  });

  bool ok;
  String message;
  Data data;

  factory PutUserModel.fromJson(Map<String, dynamic> json) => PutUserModel(
        ok: json["ok"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
