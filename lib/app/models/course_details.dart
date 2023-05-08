import 'dart:convert';

CoursesDetails coursesDetailsFromJson(String str) =>
    CoursesDetails.fromJson(json.decode(str));

String coursesDetailsToJson(CoursesDetails data) => json.encode(data.toJson());

class CoursesDetails {
  CoursesDetails({
    required this.code,
    required this.title,
    required this.description,
    required this.startDate,
    required this.lastDateToApply,
    required this.endDate,
    required this.externalUrl,
    required this.courseId,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.active,
    required this.action,
  });

  String code;
  String title;
  String description;
  DateTime startDate;
  DateTime lastDateToApply;
  DateTime endDate;
  String externalUrl;
  String courseId;
  String id;
  String createdBy;
  DateTime createdDate;
  String modifiedBy;
  DateTime modifiedDate;
  String active;
  String action;

  factory CoursesDetails.fromJson(Map<String, dynamic> json) => CoursesDetails(
        code: json["code"],
        title: json["title"],
        description: json["description"],
        startDate: DateTime.parse(json["startDate"]),
        lastDateToApply: DateTime.parse(json["lastDateToApply"]),
        endDate: DateTime.parse(json["endDate"]),
        externalUrl: json["externalUrl"],
        courseId: json["courseID"],
        id: json["id"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedBy: json["modifiedBy"],
        modifiedDate: DateTime.parse(json["modifiedDate"]),
        active: json["active"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
        "description": description,
        "startDate": startDate.toIso8601String(),
        "lastDateToApply": lastDateToApply.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "externalUrl": externalUrl,
        "courseID": courseId,
        "id": id,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate.toIso8601String(),
        "active": active,
        "action": action,
      };
}
