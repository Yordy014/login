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
        ok: json["ok"] == null ? null : json["ok"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok == null ? null : ok,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
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
        employee: json["employee"] == null ? null : json["employee"],
        cliente:
            json["cliente"] == null ? null : Cliente.fromJson(json["cliente"]),
        trabajador: json["trabajador"] == null
            ? null
            : Trabajador.fromJson(json["trabajador"]),
        billDetaiLs: json["BILL_DETAILs"] == null
            ? null
            : List<BillDetail>.from(
                json["BILL_DETAILs"].map((x) => BillDetail.fromJson(x))),
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
        "employee": employee == null ? null : employee,
        "cliente": cliente == null ? null : cliente.toJson(),
        "trabajador": trabajador == null ? null : trabajador.toJson(),
        "BILL_DETAILs": billDetaiLs == null
            ? null
            : List<dynamic>.from(billDetaiLs.map((x) => x.toJson())),
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
    this.serviceSelection,
    this.clotheType,
  });

  String idBillDetail;
  String idBill;
  dynamic idServiceType;
  List<String> idServicesType;
  String serviceTypePrice;
  String currentDept;
  DateTime lastUpdate;
  dynamic processingTime;
  dynamic serviceType;
  BillDetailDepartment department;
  List<ServiceSelection> serviceSelection;
  String clotheType;

  factory BillDetail.fromJson(Map<String, dynamic> json) => BillDetail(
        idBillDetail:
            json["ID_BILL_DETAIL"] == null ? null : json["ID_BILL_DETAIL"],
        idBill: json["ID_BILL"] == null ? null : json["ID_BILL"],
        idServiceType: json["ID_SERVICE_TYPE"],
        idServicesType: json["ID_SERVICES_TYPE"] == null
            ? null
            : List<String>.from(json["ID_SERVICES_TYPE"].map((x) => x)),
        serviceTypePrice: json["SERVICE_TYPE_PRICE"] == null
            ? null
            : json["SERVICE_TYPE_PRICE"],
        currentDept: json["CURRENT_DEPT"] == null ? null : json["CURRENT_DEPT"],
        lastUpdate: json["LAST_UPDATE"] == null
            ? null
            : DateTime.parse(json["LAST_UPDATE"]),
        processingTime: json["PROCESSING_TIME"],
        serviceType: json["SERVICE_TYPE"],
        department: json["DEPARTMENT"] == null
            ? null
            : BillDetailDepartment.fromJson(json["DEPARTMENT"]),
        serviceSelection: json["serviceSelection"] == null
            ? null
            : List<ServiceSelection>.from(json["serviceSelection"]
                .map((x) => ServiceSelection.fromJson(x))),
        clotheType: json["clothe_type"] == null ? null : json["clothe_type"],
      );

  Map<String, dynamic> toJson() => {
        "ID_BILL_DETAIL": idBillDetail == null ? null : idBillDetail,
        "ID_BILL": idBill == null ? null : idBill,
        "ID_SERVICE_TYPE": idServiceType,
        "ID_SERVICES_TYPE": idServicesType == null
            ? null
            : List<dynamic>.from(idServicesType.map((x) => x)),
        "SERVICE_TYPE_PRICE":
            serviceTypePrice == null ? null : serviceTypePrice,
        "CURRENT_DEPT": currentDept == null ? null : currentDept,
        "LAST_UPDATE": lastUpdate == null ? null : lastUpdate.toIso8601String(),
        "PROCESSING_TIME": processingTime,
        "SERVICE_TYPE": serviceType,
        "DEPARTMENT": department == null ? null : department.toJson(),
        "serviceSelection": serviceSelection == null
            ? null
            : List<dynamic>.from(serviceSelection.map((x) => x.toJson())),
        "clothe_type": clotheType == null ? null : clotheType,
      };
}

class BillDetailDepartment {
  BillDetailDepartment({
    this.idDepartment,
    this.departmentName,
    this.departmentDescr,
    this.useScanner,
  });

  String idDepartment;
  String departmentName;
  String departmentDescr;
  bool useScanner;

  factory BillDetailDepartment.fromJson(Map<String, dynamic> json) =>
      BillDetailDepartment(
        idDepartment:
            json["ID_DEPARTMENT"] == null ? null : json["ID_DEPARTMENT"],
        departmentName:
            json["DEPARTMENT_NAME"] == null ? null : json["DEPARTMENT_NAME"],
        departmentDescr:
            json["DEPARTMENT_DESCR"] == null ? null : json["DEPARTMENT_DESCR"],
        useScanner: json["USE_SCANNER"] == null ? null : json["USE_SCANNER"],
      );

  Map<String, dynamic> toJson() => {
        "ID_DEPARTMENT": idDepartment == null ? null : idDepartment,
        "DEPARTMENT_NAME": departmentName == null ? null : departmentName,
        "DEPARTMENT_DESCR": departmentDescr == null ? null : departmentDescr,
        "USE_SCANNER": useScanner == null ? null : useScanner,
      };
}

class ServiceSelection {
  ServiceSelection({
    this.clotheType,
    this.idServiceType,
    this.type,
    this.price,
    this.discount,
    this.idService,
    this.service,
    this.active,
  });

  String clotheType;
  String idServiceType;
  String type;
  String price;
  int discount;
  String idService;
  String service;
  bool active;

  factory ServiceSelection.fromJson(Map<String, dynamic> json) =>
      ServiceSelection(
        clotheType: json["CLOTHE_TYPE"] == null ? null : json["CLOTHE_TYPE"],
        idServiceType:
            json["ID_SERVICE_TYPE"] == null ? null : json["ID_SERVICE_TYPE"],
        type: json["TYPE"] == null ? null : json["TYPE"],
        price: json["PRICE"] == null ? null : json["PRICE"],
        discount: json["DISCOUNT"] == null ? null : json["DISCOUNT"],
        idService: json["ID_SERVICE"] == null ? null : json["ID_SERVICE"],
        service: json["SERVICE"] == null ? null : json["SERVICE"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "CLOTHE_TYPE": clotheType == null ? null : clotheType,
        "ID_SERVICE_TYPE": idServiceType == null ? null : idServiceType,
        "TYPE": type == null ? null : type,
        "PRICE": price == null ? null : price,
        "DISCOUNT": discount == null ? null : discount,
        "ID_SERVICE": idService == null ? null : idService,
        "SERVICE": service == null ? null : service,
        "active": active == null ? null : active,
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
        email: json["EMAIL"] == null ? null : json["EMAIL"],
        username: json["USERNAME"] == null ? null : json["USERNAME"],
        person: json["PERSON"] == null ? null : Person.fromJson(json["PERSON"]),
      );

  Map<String, dynamic> toJson() => {
        "EMAIL": email == null ? null : email,
        "USERNAME": username == null ? null : username,
        "PERSON": person == null ? null : person.toJson(),
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
        firstName: json["FIRST_NAME"] == null ? null : json["FIRST_NAME"],
        lastName: json["LAST_NAME"] == null ? null : json["LAST_NAME"],
        telNumber: json["TEL_NUMBER"] == null ? null : json["TEL_NUMBER"],
        address: json["ADDRESS"] == null ? null : json["ADDRESS"],
      );

  Map<String, dynamic> toJson() => {
        "FIRST_NAME": firstName == null ? null : firstName,
        "LAST_NAME": lastName == null ? null : lastName,
        "TEL_NUMBER": telNumber == null ? null : telNumber,
        "ADDRESS": address == null ? null : address,
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
        email: json["EMAIL"] == null ? null : json["EMAIL"],
        username: json["USERNAME"] == null ? null : json["USERNAME"],
        role: json["ROLE"] == null ? null : json["ROLE"],
        department: json["DEPARTMENT"] == null
            ? null
            : TrabajadorDepartment.fromJson(json["DEPARTMENT"]),
      );

  Map<String, dynamic> toJson() => {
        "EMAIL": email == null ? null : email,
        "USERNAME": username == null ? null : username,
        "ROLE": role == null ? null : role,
        "DEPARTMENT": department == null ? null : department.toJson(),
      };
}

class TrabajadorDepartment {
  TrabajadorDepartment({
    this.departmentName,
  });

  String departmentName;

  factory TrabajadorDepartment.fromJson(Map<String, dynamic> json) =>
      TrabajadorDepartment(
        departmentName:
            json["DEPARTMENT_NAME"] == null ? null : json["DEPARTMENT_NAME"],
      );

  Map<String, dynamic> toJson() => {
        "DEPARTMENT_NAME": departmentName == null ? null : departmentName,
      };
}
