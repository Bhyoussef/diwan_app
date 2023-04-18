import 'dart:convert';

List<CoursesList> coursesListFromJson(String str) => List<CoursesList>.from(
    json.decode(str).map((x) => CoursesList.fromJson(x)));

String coursesListToJson(List<CoursesList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
        employeeId: json["EmployeeId"],
        courseMasterId: json["CourseMasterId"],
        startDate: DateTime.parse(json["StartDate"]),
        endDate: DateTime.parse(json["EndDate"]),
        status: json["Status"],
        currentDate: DateTime.parse(json["CurrentDate"]),
        code: json["Code"],
        title: json["Title"],
        description: json["Description"],
        lastDateToApply: json["LastDateToApply"],
        id: json["Id"],
        createdBy: json["CreatedBy"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        modifiedBy: json["ModifiedBy"],
        modifiedDate: json["ModifiedDate"] == null
            ? null
            : DateTime.parse(json["ModifiedDate"]),
        active: json["Active"],
        action: json["Action"],
        validations: json["Validations"],
      );

  Map<String, dynamic> toJson() => {
        "EmployeeId": employeeId,
        "CourseMasterId": courseMasterId,
        "StartDate": startDate.toIso8601String(),
        "EndDate": endDate.toIso8601String(),
        "Status": status,
        "CurrentDate": currentDate.toIso8601String(),
        "Code": code,
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
