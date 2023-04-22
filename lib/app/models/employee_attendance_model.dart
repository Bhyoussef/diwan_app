import 'dart:convert';

List<EmployeeAttendanceModel> employeeAttendanceModelFromJson(String str) =>
    List<EmployeeAttendanceModel>.from(
        json.decode(str).map((x) => EmployeeAttendanceModel.fromJson(x)));

String employeeAttendanceModelToJson(List<EmployeeAttendanceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeAttendanceModel {
  EmployeeAttendanceModel({
    required this.employeeId,
    required this.attDate,
    this.swipeInTime,
    this.swipeOutTime,
    required this.isLateIn,
    required this.isEarlyOut,
    this.status,
    this.isManual,
    required this.departmentId,
    required this.fromTime,
    required this.toTime,
    required this.type,
    required this.fromDate,
    required this.toDate,
    this.fullNameEng,
    this.fullNameArb,
    required this.departmentName,
    required this.timeOffDate,
    this.reportType,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.active,
    required this.action,
    this.validations,
  });

  String employeeId;
  DateTime attDate;
  dynamic swipeInTime;
  dynamic swipeOutTime;
  bool isLateIn;
  bool isEarlyOut;
  dynamic status;
  dynamic isManual;
  String departmentId;
  String fromTime;
  String toTime;
  String type;
  DateTime fromDate;
  DateTime toDate;
  dynamic fullNameEng;
  dynamic fullNameArb;
  String departmentName;
  DateTime timeOffDate;
  dynamic reportType;
  String id;
  String createdBy;
  DateTime createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  dynamic active;
  String action;
  dynamic validations;

  factory EmployeeAttendanceModel.fromJson(Map<String, dynamic> json) =>
      EmployeeAttendanceModel(
        employeeId: json["EmployeeID"],
        attDate: DateTime.parse(json["AttDate"]),
        swipeInTime: json["SwipeInTime"],
        swipeOutTime: json["SwipeOutTime"],
        isLateIn: json["IsLateIn"],
        isEarlyOut: json["IsEarlyOut"],
        status: json["Status"],
        isManual: json["IsManual"],
        departmentId: json["DepartmentID"],
        fromTime: json["FromTime"],
        toTime: json["ToTime"],
        type: json["Type"],
        fromDate: DateTime.parse(json["FromDate"]),
        toDate: DateTime.parse(json["ToDate"]),
        fullNameEng: json["FullNameEng"],
        fullNameArb: json["FullNameArb"],
        departmentName: json["DepartmentName"],
        timeOffDate: DateTime.parse(json["timeOffDate"]),
        reportType: json["ReportType"],
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
        "EmployeeID": employeeId,
        "AttDate": attDate.toIso8601String(),
        "SwipeInTime": swipeInTime,
        "SwipeOutTime": swipeOutTime,
        "IsLateIn": isLateIn,
        "IsEarlyOut": isEarlyOut,
        "Status": status,
        "IsManual": isManual,
        "DepartmentID": departmentId,
        "FromTime": fromTime,
        "ToTime": toTime,
        "Type": type,
        "FromDate": fromDate.toIso8601String(),
        "ToDate": toDate.toIso8601String(),
        "FullNameEng": fullNameEng,
        "FullNameArb": fullNameArb,
        "DepartmentName": departmentName,
        "timeOffDate": timeOffDate.toIso8601String(),
        "ReportType": reportType,
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
