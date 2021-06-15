// To parse this JSON data, do
//
//     final billDetailModel = billDetailModelFromJson(jsonString);

import 'dart:convert';

BillDetailModel billDetailModelFromJson(String str) =>
    BillDetailModel.fromJson(json.decode(str));

String billDetailModelToJson(BillDetailModel data) =>
    json.encode(data.toJson());

class BillDetailModel {
  BillDetailModel({
    this.ok,
    this.data,
  });

  bool ok;
  List<DetailsBills> data;

  factory BillDetailModel.fromJson(Map<String, dynamic> json) =>
      BillDetailModel(
        ok: json["ok"] == null ? null : json["ok"],
        data: json["data"] == null
            ? null
            : List<DetailsBills>.from(
                json["data"].map((x) => DetailsBills.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok == null ? null : ok,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DetailsBills {
  DetailsBills({
    this.idBillDetail,
    this.idBill,
    this.idServiceType,
    this.serviceTypePrice,
    this.idClotheType,
    this.currentDept,
    this.lastUpdate,
    this.processingTime,
  });

  String idBillDetail;
  String idBill;
  String idServiceType;
  String serviceTypePrice;
  String idClotheType;
  String currentDept;
  DateTime lastUpdate;
  DateTime processingTime;

  factory DetailsBills.fromJson(Map<String, dynamic> json) => DetailsBills(
        idBillDetail:
            json["ID_BILL_DETAIL"] == null ? null : json["ID_BILL_DETAIL"],
        idBill: json["ID_BILL"] == null ? null : json["ID_BILL"],
        idServiceType:
            json["ID_SERVICE_TYPE"] == null ? null : json["ID_SERVICE_TYPE"],
        serviceTypePrice: json["SERVICE_TYPE_PRICE"] == null
            ? null
            : json["SERVICE_TYPE_PRICE"],
        idClotheType:
            json["ID_CLOTHE_TYPE"] == null ? null : json["ID_CLOTHE_TYPE"],
        currentDept: json["CURRENT_DEPT"] == null ? null : json["CURRENT_DEPT"],
        lastUpdate: json["LAST_UPDATE"] == null
            ? null
            : DateTime.parse(json["LAST_UPDATE"]),
        processingTime: json["PROCESSING_TIME"] == null
            ? null
            : DateTime.parse(json["PROCESSING_TIME"]),
      );

  Map<String, dynamic> toJson() => {
        "ID_BILL_DETAIL": idBillDetail == null ? null : idBillDetail,
        "ID_BILL": idBill == null ? null : idBill,
        "ID_SERVICE_TYPE": idServiceType == null ? null : idServiceType,
        "SERVICE_TYPE_PRICE":
            serviceTypePrice == null ? null : serviceTypePrice,
        "ID_CLOTHE_TYPE": idClotheType == null ? null : idClotheType,
        "CURRENT_DEPT": currentDept == null ? null : currentDept,
        "LAST_UPDATE": lastUpdate == null ? null : lastUpdate.toIso8601String(),
        "PROCESSING_TIME":
            processingTime == null ? null : processingTime.toIso8601String(),
      };
}
