// To parse this JSON data, do
//
//     final clotheModel = clotheModelFromJson(jsonString);

import 'dart:convert';

ClotheModel clotheModelFromJson(String str) =>
    ClotheModel.fromJson(json.decode(str));

String clotheModelToJson(ClotheModel data) => json.encode(data.toJson());

class ClotheModel {
  ClotheModel({
    this.ok,
    this.data,
  });

  bool ok;
  Data data;

  factory ClotheModel.fromJson(Map<String, dynamic> json) => ClotheModel(
        ok: json["ok"] == null ? null : json["ok"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok == null ? null : ok,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.idClotheType,
    this.clotheType,
    this.notes,
    this.active,
  });

  String idClotheType;
  String clotheType;
  String notes;
  bool active;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idClotheType:
            json["ID_CLOTHE_TYPE"] == null ? null : json["ID_CLOTHE_TYPE"],
        clotheType: json["CLOTHE_TYPE"] == null ? null : json["CLOTHE_TYPE"],
        notes: json["NOTES"] == null ? null : json["NOTES"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "ID_CLOTHE_TYPE": idClotheType == null ? null : idClotheType,
        "CLOTHE_TYPE": clotheType == null ? null : clotheType,
        "NOTES": notes == null ? null : notes,
        "active": active == null ? null : active,
      };
}
