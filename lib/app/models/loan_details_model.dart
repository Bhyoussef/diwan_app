import 'dart:convert';

List<LoanDetailsModel> loanFromJson(String str) =>
    List<LoanDetailsModel>.from(json.decode(str).map((x) => LoanDetailsModel.fromJson(x)));

String loanToJson(List<LoanDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoanDetailsModel {
  String loandMasterId;
  String employeeId;
  double requestedAmount;
  double approvedAmount;
  int noOfInstallment;
  DateTime startDate;
  String remarks;
  double installmentAmount;
  String status;
  double totelAddition;
  double totelDeduction;
  double deduction;
  double pendingLoanAmount;
  int approvedLevel;
  bool hrDepartment;
  bool headOfHrDepartment;
  String id;
  String createdBy;
  DateTime createdDate;
  String modifiedBy;
  DateTime modifiedDate;
  String active;
  String action;

  LoanDetailsModel({
    required this.loandMasterId,
    required this.employeeId,
    required this.requestedAmount,
    required this.approvedAmount,
    required this.noOfInstallment,
    required this.startDate,
    required this.remarks,
    required this.installmentAmount,
    required this.status,
    required this.totelAddition,
    required this.totelDeduction,
    required this.deduction,
    required this.pendingLoanAmount,
    required this.approvedLevel,
    required this.hrDepartment,
    required this.headOfHrDepartment,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.active,
    required this.action,
  });

  factory LoanDetailsModel.fromJson(Map<String, dynamic> json) => LoanDetailsModel(
    loandMasterId: json["loandMasterId"],
    employeeId: json["employeeId"],
    requestedAmount: json["requestedAmount"],
    approvedAmount: json["approvedAmount"],
    noOfInstallment: json["noOfInstallment"],
    startDate: DateTime.parse(json["startDate"]),
    remarks: json["remarks"],
    installmentAmount: json["installmentAmount"]?.toDouble(),
    status: json["status"],
    totelAddition: json["totelAddition"],
    totelDeduction: json["totelDeduction"],
    deduction: json["deduction"],
    pendingLoanAmount: json["pendingLoanAmount"]?.toDouble(),
    approvedLevel: json["approvedLevel"],
    hrDepartment: json["hrDepartment"],
    headOfHrDepartment: json["headOfHrDepartment"],
    id: json["id"],
    createdBy: json["createdBy"],
    createdDate: DateTime.parse(json["createdDate"]),
    modifiedBy: json["modifiedBy"],
    modifiedDate: DateTime.parse(json["modifiedDate"]),
    active: json["active"],
    action: json["action"],
  );

  Map<String, dynamic> toJson() => {
    "loandMasterId": loandMasterId,
    "employeeId": employeeId,
    "requestedAmount": requestedAmount,
    "approvedAmount": approvedAmount,
    "noOfInstallment": noOfInstallment,
    "startDate": startDate.toIso8601String(),
    "remarks": remarks,
    "installmentAmount": installmentAmount,
    "status": status,
    "totelAddition": totelAddition,
    "totelDeduction": totelDeduction,
    "deduction": deduction,
    "pendingLoanAmount": pendingLoanAmount,
    "approvedLevel": approvedLevel,
    "hrDepartment": hrDepartment,
    "headOfHrDepartment": headOfHrDepartment,
    "id": id,
    "createdBy": createdBy,
    "createdDate": createdDate.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedDate": modifiedDate.toIso8601String(),
    "active": active,
    "action": action,
  };
}
