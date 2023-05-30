import 'dart:convert';

List<Leave> leaveFromJson(String str) =>
    List<Leave>.from(json.decode(str).map((x) => Leave.fromJson(x)));

String leaveToJson(List<Leave> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Leave {
  String leaveMasterId;
  String employeeId;
  DateTime fromDate;
  DateTime toDate;
  double leaveDays;
  bool withAdvanceSalary;
  String remarks;
  String status;
  bool leaveAdvancePaid;
  bool isEditDelete;
  bool isApproveReject;
  String empName;
  bool isAllowCancel;
  bool isApproveTrainngLeaveCansel;
  String id;
  String createdBy;
  DateTime createdDate;
  String active;
  String action;
  String? modifiedBy;
  DateTime? modifiedDate;

  Leave({
    required this.leaveMasterId,
    required this.employeeId,
    required this.fromDate,
    required this.toDate,
    required this.leaveDays,
    required this.withAdvanceSalary,
    required this.remarks,
    required this.status,
    required this.leaveAdvancePaid,
    required this.isEditDelete,
    required this.isApproveReject,
    required this.empName,
    required this.isAllowCancel,
    required this.isApproveTrainngLeaveCansel,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    required this.active,
    required this.action,
    this.modifiedBy,
    this.modifiedDate,
  });

  factory Leave.fromJson(Map<String, dynamic> json) => Leave(
        leaveMasterId: json["leaveMasterId"],
        employeeId: json["employeeId"],
        fromDate: DateTime.parse(json["fromDate"]),
        toDate: DateTime.parse(json["toDate"]),
        leaveDays: json["leaveDays"],
        withAdvanceSalary: json["withAdvanceSalary"],
        remarks: json["remarks"],
        status: json["status"],
        leaveAdvancePaid: json["leaveAdvancePaid"],
        isEditDelete: json["isEditDelete"],
        isApproveReject: json["isApproveReject"],
        empName: json["empName"],
        isAllowCancel: json["isAllowCancel"],
        isApproveTrainngLeaveCansel: json["isApproveTrainngLeaveCansel"],
        id: json["id"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        active: json["active"],
        action: json["action"],
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"] == null
            ? null
            : DateTime.parse(json["modifiedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "leaveMasterId": leaveMasterId,
        "employeeId": employeeId,
        "fromDate": fromDate.toIso8601String(),
        "toDate": toDate.toIso8601String(),
        "leaveDays": leaveDays,
        "withAdvanceSalary": withAdvanceSalary,
        "remarks": remarks,
        "status": status,
        "leaveAdvancePaid": leaveAdvancePaid,
        "isEditDelete": isEditDelete,
        "isApproveReject": isApproveReject,
        "empName": empName,
        "isAllowCancel": isAllowCancel,
        "isApproveTrainngLeaveCansel": isApproveTrainngLeaveCansel,
        "id": id,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "active": active,
        "action": action,
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
      };
}
