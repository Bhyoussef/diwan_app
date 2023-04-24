import 'dart:convert';

List<HrTypeList> hrTypeListFromJson(String str) =>
    List<HrTypeList>.from(json.decode(str).map((x) => HrTypeList.fromJson(x)));

String hrTypeListToJson(List<HrTypeList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HrTypeList {
  HrTypeList({
    required this.hrCertificateId,
    required this.employeeId,
    required this.withSignature,
    required this.documentType,
    required this.certificateNo,
    required this.empNumber,
    required this.empName,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    required this.active,
    required this.action,
    this.validations,
  });

  String hrCertificateId;
  String employeeId;
  bool withSignature;
  String documentType;
  String certificateNo;
  String empNumber;
  String empName;
  String id;
  String createdBy;
  DateTime createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  String active;
  String action;
  dynamic validations;

  factory HrTypeList.fromJson(Map<String, dynamic> json) => HrTypeList(
        hrCertificateId: json["hrCertificateId"],
        employeeId: json["employeeId"],
        withSignature: json["withSignature"],
        documentType: json["documentType"],
        certificateNo: json["certificateNo"],
        empNumber: json["empNumber"],
        empName: json["empName"],
        id: json["id"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"],
        active: json["active"],
        action: json["action"],
        validations: json["validations"],
      );

  Map<String, dynamic> toJson() => {
        "hrCertificateId": hrCertificateId,
        "employeeId": employeeId,
        "withSignature": withSignature,
        "documentType": documentType,
        "certificateNo": certificateNo,
        "empNumber": empNumber,
        "empName": empName,
        "id": id,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate,
        "active": active,
        "action": action,
        "validations": validations,
      };
}
