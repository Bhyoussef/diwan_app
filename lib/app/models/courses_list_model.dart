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
    required this.courseName,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    required this.active,
    required this.action,
  });

  String employeeId;
  String courseMasterId;
  DateTime startDate;
  DateTime endDate;
  String status;
  DateTime currentDate;
  String courseName;
  String id;
  String createdBy;
  DateTime createdDate;
  String? modifiedBy;
  DateTime? modifiedDate;
  String active;
  String action;

  factory CoursesList.fromJson(Map<String, dynamic> json) => CoursesList(
        employeeId: json["employeeId"],
        courseMasterId: json["courseMasterId"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        status: json["status"],
        currentDate: DateTime.parse(json["currentDate"]),
        courseName: json["courseName"],
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
        "employeeId": employeeId,
        "courseMasterId": courseMasterId,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "status": status,
        "currentDate": currentDate.toIso8601String(),
        "courseName": courseName,
        "id": id,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "active": active,
        "action": action,
      };
}
