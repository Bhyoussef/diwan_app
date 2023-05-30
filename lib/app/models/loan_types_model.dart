// To parse this JSON data, do
//
//     final loanTypesModel = loanTypesModelFromJson(jsonString);

import 'dart:convert';

List<LoanTypesModel> loanTypesModelFromJson(String str) => List<LoanTypesModel>.from(json.decode(str).map((x) => LoanTypesModel.fromJson(x)));

String loanTypesModelToJson(List<LoanTypesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoanTypesModel {
  String code;
  String name;
  double maxAllowed;
  String componentCode;
  String loantype;
  bool attachamentReq;
  String? nameAr;
  String id;
  String createdBy;
  DateTime createdDate;
  String modifiedBy;
  DateTime modifiedDate;
  String active;
  String action;

  LoanTypesModel({
    required this.code,
    required this.name,
    required this.maxAllowed,
    required this.componentCode,
    required this.loantype,
    required this.attachamentReq,
    this.nameAr,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.active,
    required this.action,
  });

  factory LoanTypesModel.fromJson(Map<String, dynamic> json) => LoanTypesModel(
    code: json["code"],
    name: json["name"],
    maxAllowed: json["maxAllowed"],
    componentCode: json["componentCode"],
    loantype: json["loantype"],
    attachamentReq: json["attachamentReq"],
    nameAr: json["nameAr"],
    id: json["id"],
    createdBy: json["createdBy"],
    createdDate: DateTime.parse(json["createdDate"]),
    modifiedBy: json["modifiedBy"],
    modifiedDate: DateTime.parse(json["modifiedDate"]),
    active: json["active"],
    action: json["action"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "maxAllowed": maxAllowed,
    "componentCode": componentCode,
    "loantype": loantype,
    "attachamentReq": attachamentReq,
    "nameAr": nameAr,
    "id": id,
    "createdBy": createdBy,
    "createdDate": createdDate.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedDate": modifiedDate.toIso8601String(),
    "active": active,
    "action": action,
  };
}
