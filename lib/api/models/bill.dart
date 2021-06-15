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
  List<BillItems> data;

  factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
        ok: json["ok"] == null ? null : json["ok"],
        data: json["data"] == null
            ? null
            : List<BillItems>.from(
                json["data"].map((x) => BillItems.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok == null ? null : ok,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BillItems {
  BillItems({
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

  factory BillItems.fromJson(Map<String, dynamic> json) => BillItems(
        idBill: json["ID_BILL"] == null ? null : json["ID_BILL"],
        customer: json["CUSTOMER"] == null ? null : json["CUSTOMER"],
        currentDate: json["CURRENT_DATE"] == null
            ? null
            : DateTime.parse(json["CURRENT_DATE"]),
        dateDeliver: json["DATE_DELIVER"] == null
            ? null
            : DateTime.parse(json["DATE_DELIVER"]),
        subTotal: json["SUB_TOTAL"] == null ? null : json["SUB_TOTAL"],
        discount: json["DISCOUNT"] == null ? null : json["DISCOUNT"],
        itbis: json["ITBIS"] == null ? null : json["ITBIS"],
        active: json["active"] == null ? null : json["active"],
        employee: json["employee"],
      );

  Map<String, dynamic> toJson() => {
        "ID_BILL": idBill == null ? null : idBill,
        "CUSTOMER": customer == null ? null : customer,
        "CURRENT_DATE":
            currentDate == null ? null : currentDate.toIso8601String(),
        "DATE_DELIVER":
            dateDeliver == null ? null : dateDeliver.toIso8601String(),
        "SUB_TOTAL": subTotal == null ? null : subTotal,
        "DISCOUNT": discount == null ? null : discount,
        "ITBIS": itbis == null ? null : itbis,
        "active": active == null ? null : active,
        "employee": employee,
      };
}
