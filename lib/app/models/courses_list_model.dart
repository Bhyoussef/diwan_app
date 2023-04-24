import 'dart:convert';

List<CoursesList> coursesListFromJson(String str) => List<CoursesList>.from(json.decode(str).map((x) => CoursesList.fromJson(x)));

String coursesListToJson(List<CoursesList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoursesList {
  CoursesList({
    required this.employeeId,
    required this.courseMasterId,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.currentDate,
    this.code,
    this.title,
    this.description,
    this.lastDateToApply,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    required this.active,
    required this.action,
    this.validations,
  });

  String employeeId;
  String courseMasterId;
  DateTime startDate;
  DateTime endDate;
  String status;
  DateTime currentDate;
  dynamic code;
  dynamic title;
  dynamic description;
  dynamic lastDateToApply;
  String id;
  String createdBy;
  DateTime createdDate;
  String? modifiedBy;
  DateTime? modifiedDate;
  String active;
  String action;
  dynamic validations;

  factory CoursesList.fromJson(Map<String, dynamic> json) => CoursesList(
        employeeId: json["employeeId"],
        courseMasterId: json["courseMasterId"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        status: json["status"],
        currentDate: DateTime.parse(json["currentDate"]),
        code: json["code"],
        title: json["Title"],
        description: json["Description"],
        lastDateToApply: json["LastDateToApply"],
        id: json["id"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedBy: json["ModifiedBy"],
        modifiedDate: json["ModifiedDate"] == null
            ? null
            : DateTime.parse(json["ModifiedDate"]),
        active: json["active"],
        action: json["action"],
        validations: json["Validations"],
      );

  Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "courseMasterId": courseMasterId,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "status": status,
        "CurrentDate": currentDate.toIso8601String(),
        "code": code,
        "Title": title,
        "Description": description,
        "LastDateToApply": lastDateToApply,
        "Id": id,
        "CreatedBy": createdBy,
        "CreatedDate": createdDate.toIso8601String(),
        "ModifiedBy": modifiedBy,
        "ModifiedDate": modifiedDate?.toIso8601String(),
        "Active": active,
        "Action": action,
        "Validations": validations,
      };
}
