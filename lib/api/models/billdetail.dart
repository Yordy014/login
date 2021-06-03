// To parse this JSON data, do
//
//     final billdetail = billdetailFromJson(jsonString);

import 'dart:convert';

Billdetail billdetailFromJson(String str) =>
    Billdetail.fromJson(json.decode(str));

String billdetailToJson(Billdetail data) => json.encode(data.toJson());

class Billdetail {
  Billdetail({
    this.ok,
    this.data,
  });

  bool ok;
  List<Datum> data;

  factory Billdetail.fromJson(Map<String, dynamic> json) => Billdetail(
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idBillDetail: json["ID_BILL_DETAIL"],
        idBill: json["ID_BILL"],
        idServiceType: json["ID_SERVICE_TYPE"],
        serviceTypePrice: json["SERVICE_TYPE_PRICE"],
        idClotheType: json["ID_CLOTHE_TYPE"],
        currentDept: json["CURRENT_DEPT"],
        lastUpdate: DateTime.parse(json["LAST_UPDATE"]),
        processingTime: DateTime.parse(json["PROCESSING_TIME"]),
      );

  Map<String, dynamic> toJson() => {
        "ID_BILL_DETAIL": idBillDetail,
        "ID_BILL": idBill,
        "ID_SERVICE_TYPE": idServiceType,
        "SERVICE_TYPE_PRICE": serviceTypePrice,
        "ID_CLOTHE_TYPE": idClotheType,
        "CURRENT_DEPT": currentDept,
        "LAST_UPDATE": lastUpdate.toIso8601String(),
        "PROCESSING_TIME": processingTime.toIso8601String(),
      };
}
