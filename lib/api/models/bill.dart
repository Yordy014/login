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
    this.cliente,
    this.trabajador,
    this.billDetaiLs,
  });

  String idBill;
  String customer;
  DateTime currentDate;
  DateTime dateDeliver;
  String subTotal;
  String discount;
  String itbis;
  bool active;
  String employee;
  Cliente cliente;
  Trabajador trabajador;
  List<BillDetail> billDetaiLs;

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
        cliente: Cliente.fromJson(json["cliente"]),
        trabajador: Trabajador.fromJson(json["trabajador"]),
        billDetaiLs: List<BillDetail>.from(
            json["BILL_DETAILs"].map((x) => BillDetail.fromJson(x))),
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
        "cliente": cliente.toJson(),
        "trabajador": trabajador.toJson(),
        "BILL_DETAILs": List<dynamic>.from(billDetaiLs.map((x) => x.toJson())),
      };
}

class BillDetail {
  BillDetail({
    this.idBillDetail,
    this.idBill,
    this.idServiceType,
    this.idServicesType,
    this.serviceTypePrice,
    this.currentDept,
    this.lastUpdate,
    this.processingTime,
    this.serviceType,
    this.department,
  });

  String idBillDetail;
  String idBill;
  String idServiceType;
  List<String> idServicesType;
  String serviceTypePrice;
  String currentDept;
  DateTime lastUpdate;
  DateTime processingTime;
  ServiceType serviceType;
  BillDetailDepartment department;

  factory BillDetail.fromJson(Map<String, dynamic> json) => BillDetail(
        idBillDetail: json["ID_BILL_DETAIL"],
        idBill: json["ID_BILL"],
        idServiceType: json["ID_SERVICE_TYPE"],
        idServicesType:
            List<String>.from(json["ID_SERVICES_TYPE"].map((x) => x)),
        serviceTypePrice: json["SERVICE_TYPE_PRICE"],
        currentDept: json["CURRENT_DEPT"],
        lastUpdate: DateTime.parse(json["LAST_UPDATE"]),
        processingTime: DateTime.parse(json["PROCESSING_TIME"]),
        serviceType: ServiceType.fromJson(json["SERVICE_TYPE"]),
        department: BillDetailDepartment.fromJson(json["DEPARTMENT"]),
      );

  Map<String, dynamic> toJson() => {
        "ID_BILL_DETAIL": idBillDetail,
        "ID_BILL": idBill,
        "ID_SERVICE_TYPE": idServiceType,
        "ID_SERVICES_TYPE": List<dynamic>.from(idServicesType.map((x) => x)),
        "SERVICE_TYPE_PRICE": serviceTypePrice,
        "CURRENT_DEPT": currentDept,
        "LAST_UPDATE": lastUpdate.toIso8601String(),
        "PROCESSING_TIME": processingTime.toIso8601String(),
        "SERVICE_TYPE": serviceType.toJson(),
        "DEPARTMENT": department.toJson(),
      };
}

class BillDetailDepartment {
  BillDetailDepartment({
    this.idDepartment,
    this.departmentName,
    this.departmentDescr,
  });

  String idDepartment;
  String departmentName;
  String departmentDescr;

  factory BillDetailDepartment.fromJson(Map<String, dynamic> json) =>
      BillDetailDepartment(
        idDepartment: json["ID_DEPARTMENT"],
        departmentName: json["DEPARTMENT_NAME"],
        departmentDescr: json["DEPARTMENT_DESCR"],
      );

  Map<String, dynamic> toJson() => {
        "ID_DEPARTMENT": idDepartment,
        "DEPARTMENT_NAME": departmentName,
        "DEPARTMENT_DESCR": departmentDescr,
      };
}

class ServiceType {
  ServiceType({
    this.type,
    this.price,
    this.discount,
    this.clotheType,
  });

  String type;
  String price;
  int discount;
  ClotheType clotheType;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        type: json["TYPE"],
        price: json["PRICE"],
        discount: json["DISCOUNT"],
        clotheType: ClotheType.fromJson(json["clothe_type"]),
      );

  Map<String, dynamic> toJson() => {
        "TYPE": type,
        "PRICE": price,
        "DISCOUNT": discount,
        "clothe_type": clotheType.toJson(),
      };
}

class ClotheType {
  ClotheType({
    this.clotheType,
  });

  String clotheType;

  factory ClotheType.fromJson(Map<String, dynamic> json) => ClotheType(
        clotheType: json["CLOTHE_TYPE"],
      );

  Map<String, dynamic> toJson() => {
        "CLOTHE_TYPE": clotheType,
      };
}

class Cliente {
  Cliente({
    this.email,
    this.username,
    this.person,
  });

  String email;
  String username;
  Person person;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        email: json["EMAIL"],
        username: json["USERNAME"],
        person: Person.fromJson(json["PERSON"]),
      );

  Map<String, dynamic> toJson() => {
        "EMAIL": email,
        "USERNAME": username,
        "PERSON": person.toJson(),
      };
}

class Person {
  Person({
    this.firstName,
    this.lastName,
    this.telNumber,
    this.address,
  });

  String firstName;
  String lastName;
  String telNumber;
  String address;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        firstName: json["FIRST_NAME"],
        lastName: json["LAST_NAME"],
        telNumber: json["TEL_NUMBER"],
        address: json["ADDRESS"],
      );

  Map<String, dynamic> toJson() => {
        "FIRST_NAME": firstName,
        "LAST_NAME": lastName,
        "TEL_NUMBER": telNumber,
        "ADDRESS": address,
      };
}

class Trabajador {
  Trabajador({
    this.email,
    this.username,
    this.role,
    this.department,
  });

  String email;
  String username;
  String role;
  TrabajadorDepartment department;

  factory Trabajador.fromJson(Map<String, dynamic> json) => Trabajador(
        email: json["EMAIL"],
        username: json["USERNAME"],
        role: json["ROLE"],
        department: TrabajadorDepartment.fromJson(json["DEPARTMENT"]),
      );

  Map<String, dynamic> toJson() => {
        "EMAIL": email,
        "USERNAME": username,
        "ROLE": role,
        "DEPARTMENT": department.toJson(),
      };
}

class TrabajadorDepartment {
  TrabajadorDepartment({
    this.departmentName,
  });

  String departmentName;

  factory TrabajadorDepartment.fromJson(Map<String, dynamic> json) =>
      TrabajadorDepartment(
        departmentName: json["DEPARTMENT_NAME"],
      );

  Map<String, dynamic> toJson() => {
        "DEPARTMENT_NAME": departmentName,
      };
}
