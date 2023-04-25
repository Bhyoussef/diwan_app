// To parse this JSON data, do
//
//     final employeeAttendanceModel = employeeAttendanceModelFromJson(jsonString);

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
    required this.isLateIn,
    required this.isEarlyOut,
    required this.departmentId,
    required this.fromTime,
    required this.toTime,
    required this.type,
    required this.fromDate,
    required this.toDate,
    required this.departmentName,
    required this.timeOffDate,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    required this.action,
  });

  String employeeId;
  DateTime attDate;
  bool isLateIn;
  bool isEarlyOut;
  String departmentId;
  String fromTime;
  String toTime;
  String type;
  DateTime fromDate;
  DateTime toDate;
  String departmentName;
  DateTime timeOffDate;
  String id;
  String createdBy;
  DateTime createdDate;
  String action;

  factory EmployeeAttendanceModel.fromJson(Map<String, dynamic> json) =>
      EmployeeAttendanceModel(
        employeeId: json["employeeID"],
        attDate: DateTime.parse(json["attDate"]),
        isLateIn: json["isLateIn"],
        isEarlyOut: json["isEarlyOut"],
        departmentId: json["departmentID"],
        fromTime: json["fromTime"],
        toTime: json["toTime"],
        type: json["type"],
        fromDate: DateTime.parse(json["fromDate"]),
        toDate: DateTime.parse(json["toDate"]),
        departmentName: json["departmentName"],
        timeOffDate: DateTime.parse(json["timeOffDate"]),
        id: json["id"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "employeeID": employeeId,
        "attDate": attDate.toIso8601String(),
        "isLateIn": isLateIn,
        "isEarlyOut": isEarlyOut,
        "departmentID": departmentId,
        "fromTime": fromTime,
        "toTime": toTime,
        "type": type,
        "fromDate": fromDate.toIso8601String(),
        "toDate": toDate.toIso8601String(),
        "departmentName": departmentName,
        "timeOffDate": timeOffDate.toIso8601String(),
        "id": id,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "action": action,
      };
}
