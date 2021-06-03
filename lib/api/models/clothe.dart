// To parse this JSON data, do
//
//     final clothe = clotheFromJson(jsonString);

import 'dart:convert';

Clothe clotheFromJson(String str) => Clothe.fromJson(json.decode(str));

String clotheToJson(Clothe data) => json.encode(data.toJson());

class Clothe {
  Clothe({
    this.ok,
    this.data,
  });

  bool ok;
  List<Datum> data;

  factory Clothe.fromJson(Map<String, dynamic> json) => Clothe(
        ok: json["ok"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.idClotheType,
    this.clotheType,
    this.notes,
    this.active,
  });

  String idClotheType;
  String clotheType;
  String notes;
  bool active;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idClotheType: json["ID_CLOTHE_TYPE"],
        clotheType: json["CLOTHE_TYPE"],
        notes: json["NOTES"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "ID_CLOTHE_TYPE": idClotheType,
        "CLOTHE_TYPE": clotheType,
        "NOTES": notes,
        "active": active,
      };
}
