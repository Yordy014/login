// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

ServicesModel servicesModelFromJson(String str) =>
    ServicesModel.fromJson(json.decode(str));

String servicesModelToJson(ServicesModel data) => json.encode(data.toJson());

class ServicesModel {
  ServicesModel({
    this.ok,
    this.data,
  });

  bool ok;
  List<Datum> data;

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
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
    this.active,
    this.serviceTypEs,
  });

  String idClotheType;
  String clotheType;
  bool active;
  List<ServiceType> serviceTypEs;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idClotheType: json["ID_CLOTHE_TYPE"],
        clotheType: json["CLOTHE_TYPE"],
        active: json["active"],
        serviceTypEs: List<ServiceType>.from(
            json["SERVICE_TYPEs"].map((x) => ServiceType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID_CLOTHE_TYPE": idClotheType,
        "CLOTHE_TYPE": clotheType,
        "active": active,
        "SERVICE_TYPEs":
            List<dynamic>.from(serviceTypEs.map((x) => x.toJson())),
      };
}

class ServiceType {
  ServiceType({
    this.idServiceType,
    this.type,
    this.idService,
    this.price,
    this.discount,
    this.idClotheType,
  });

  String idServiceType;
  String type;
  String idService;
  String price;
  int discount;
  String idClotheType;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        idServiceType: json["ID_SERVICE_TYPE"],
        type: json["TYPE"],
        idService: json["ID_SERVICE"],
        price: json["PRICE"],
        discount: json["DISCOUNT"],
        idClotheType: json["ID_CLOTHE_TYPE"],
      );

  Map<String, dynamic> toJson() => {
        "ID_SERVICE_TYPE": idServiceType,
        "TYPE": type,
        "ID_SERVICE": idService,
        "PRICE": price,
        "DISCOUNT": discount,
        "ID_CLOTHE_TYPE": idClotheType,
      };
}
