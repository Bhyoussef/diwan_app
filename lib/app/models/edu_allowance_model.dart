import 'dart:convert';

List<EduAllowanceModel> eduAllowanceModelFromJson(String str) => List<EduAllowanceModel>.from(json.decode(str).map((x) => EduAllowanceModel.fromJson(x)));

String eduAllowanceModelToJson(List<EduAllowanceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EduAllowanceModel {
  String code;
  String name;
  String type;
  int maxAllowed;
  String componentCode;
  String eduNameAr;
  String id;
  String createdBy;
  DateTime createdDate;
  String modifiedBy;
  DateTime modifiedDate;
  String active;
  String action;

  EduAllowanceModel({
    required this.code,
    required this.name,
    required this.type,
    required this.maxAllowed,
    required this.componentCode,
    required this.eduNameAr,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.active,
    required this.action,
  });

  factory EduAllowanceModel.fromJson(Map<String, dynamic> json) => EduAllowanceModel(
    code: json["code"],
    name: json["name"],
    type: json["type"],
    maxAllowed: json["maxAllowed"].toInt(),
    componentCode: json["componentCode"],
    eduNameAr: json["eduNameAR"] ??"",
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
    "type": type,
    "maxAllowed": maxAllowed,
    "componentCode": componentCode,
    "eduNameAR": eduNameAr,
    "id": id,
    "createdBy": createdBy,
    "createdDate": createdDate.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedDate": modifiedDate.toIso8601String(),
    "active": active,
    "action": action,
  };
}
