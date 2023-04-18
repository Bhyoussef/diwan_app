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
        hrCertificateId: json["HRCertificateId"],
        employeeId: json["EmployeeId"],
        withSignature: json["WithSignature"],
        documentType: json["DocumentType"],
        certificateNo: json["CertificateNo"],
        empNumber: json["EmpNumber"],
        empName: json["EmpName"],
        id: json["Id"],
        createdBy: json["CreatedBy"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        modifiedBy: json["ModifiedBy"],
        modifiedDate: json["ModifiedDate"],
        active: json["Active"],
        action: json["Action"],
        validations: json["Validations"],
      );

  Map<String, dynamic> toJson() => {
        "HRCertificateId": hrCertificateId,
        "EmployeeId": employeeId,
        "WithSignature": withSignature,
        "DocumentType": documentType,
        "CertificateNo": certificateNo,
        "EmpNumber": empNumber,
        "EmpName": empName,
        "Id": id,
        "CreatedBy": createdBy,
        "CreatedDate": createdDate.toIso8601String(),
        "ModifiedBy": modifiedBy,
        "ModifiedDate": modifiedDate,
        "Active": active,
        "Action": action,
        "Validations": validations,
      };
}
