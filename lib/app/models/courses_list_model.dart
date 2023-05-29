import 'dart:convert';

List<CoursesList> coursesListFromJson(String str) => List<CoursesList>.from(
    json.decode(str).map((x) => CoursesList.fromJson(x)));

String coursesListToJson(List<CoursesList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoursesList {
  String code;
  String title;
  String description;
  DateTime startDate;
  DateTime lastDateToApply;
  DateTime? endDate;
  String externalUrl;
  String status;
  String courseId;
  String id;
  String createdBy;
  DateTime createdDate;
  String active;
  String action;
  String? modifiedBy;
  DateTime? modifiedDate;

  CoursesList({
    required this.code,
    required this.title,
    required this.description,
    required this.startDate,
    required this.lastDateToApply,
    this.endDate,
    required this.externalUrl,
    required this.status,
    required this.courseId,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    required this.active,
    required this.action,
    this.modifiedBy,
    this.modifiedDate,
  });

  factory CoursesList.fromJson(Map<String, dynamic> json) => CoursesList(
        code: json["code"],
        title: json["title"],
        description: json["description"],
        startDate: DateTime.parse(json["startDate"]),
        lastDateToApply: DateTime.parse(json["lastDateToApply"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        externalUrl: json["externalUrl"],
        status: json["status"],
        courseId: json["courseID"],
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
        "code": code,
        "title": title,
        "description": description,
        "startDate": startDate.toIso8601String(),
        "lastDateToApply": lastDateToApply.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "externalUrl": externalUrl,
        "status": status,
        "courseID": courseId,
        "id": id,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "active": active,
        "action": action,
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
      };
}
