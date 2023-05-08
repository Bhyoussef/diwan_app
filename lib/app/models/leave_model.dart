import 'dart:convert';

List<Leave> leaveFromJson(String str) =>
    List<Leave>.from(json.decode(str).map((x) => Leave.fromJson(x)));

String leaveToJson(List<Leave> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Leave {
  String code;
  String nameEng;
  String nameArb;
  bool managerAppReq;
  bool hrAppReq;
  bool attachamentReq;
  int maxAllowedDays;
  bool renewableYearly;
  String leaveType;
  bool validateBalance;
  String id;
  String createdBy;
  DateTime createdDate;
  String? modifiedBy;
  DateTime? modifiedDate;
  String active;
  String action;

  Leave({
    required this.code,
    required this.nameEng,
    required this.nameArb,
    required this.managerAppReq,
    required this.hrAppReq,
    required this.attachamentReq,
    required this.maxAllowedDays,
    required this.renewableYearly,
    required this.leaveType,
    required this.validateBalance,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    required this.active,
    required this.action,
  });

  factory Leave.fromJson(Map<String, dynamic> json) => Leave(
        code: json["code"],
        nameEng: json["nameEng"],
        nameArb: json["nameArb"],
        managerAppReq: json["managerAppReq"],
        hrAppReq: json["hrAppReq"],
        attachamentReq: json["attachamentReq"],
        maxAllowedDays: json["maxAllowedDays"],
        renewableYearly: json["renewableYearly"],
        leaveType: json["leaveType"],
        validateBalance: json["validateBalance"],
        id: json["id"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"] == null
            ? null
            : DateTime.parse(json["modifiedDate"]),
        active: json["active"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "nameEng": nameEng,
        "nameArb": nameArb,
        "managerAppReq": managerAppReq,
        "hrAppReq": hrAppReq,
        "attachamentReq": attachamentReq,
        "maxAllowedDays": maxAllowedDays,
        "renewableYearly": renewableYearly,
        "leaveType": leaveType,
        "validateBalance": validateBalance,
        "id": id,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "active": active,
        "action": action,
      };
}
