// To parse this JSON data, do
//
//     final billModel = billModelFromJson(jsonString);

import 'dart:convert';

BillModel billModelFromJson(String str) => BillModel.fromJson(json.decode(str));

String billModelToJson(BillModel data) => json.encode(data.toJson());

class BillModel {
  BillModel({
    this.ok,
    this.data,
  });

  bool ok;
  List<Datum> data;

  factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
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
    this.idBill,
    this.customer,
    this.currentDate,
    this.dateDeliver,
    this.subTotal,
    this.discount,
    this.itbis,
    this.active,
    this.employee,
  });

  String idBill;
  String customer;
  DateTime currentDate;
  DateTime dateDeliver;
  String subTotal;
  String discount;
  String itbis;
  bool active;
  dynamic employee;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idBill: json["ID_BILL"],
        customer: json["CUSTOMER"],
        currentDate: DateTime.parse(json["CURRENT_DATE"]),
        dateDeliver: DateTime.parse(json["DATE_DELIVER"]),
        subTotal: json["SUB_TOTAL"],
        discount: json["DISCOUNT"],
        itbis: json["ITBIS"],
        active: json["active"],
        employee: json["employee"],
      );

  Map<String, dynamic> toJson() => {
        "ID_BILL": idBill,
        "CUSTOMER": customer,
        "CURRENT_DATE": currentDate.toIso8601String(),
        "DATE_DELIVER": dateDeliver.toIso8601String(),
        "SUB_TOTAL": subTotal,
        "DISCOUNT": discount,
        "ITBIS": itbis,
        "active": active,
        "employee": employee,
      };
}
