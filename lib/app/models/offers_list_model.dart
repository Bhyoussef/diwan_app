import 'dart:convert';

List<OffersList> offersListFromJson(String str) => List<OffersList>.from(json.decode(str).map((x) => OffersList.fromJson(x)));

String offersListToJson(List<OffersList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OffersList {
  OffersList({
    required this.code,
    required this.title,
    required this.description,
    required this.validFrom,
    required this.validTo,
    required this.externalUrl,
    this.logoContent,
    this.categoryCode,
    required this.inActive,
    required this.activeList,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    required this.active,
    required this.action,
    this.validations,
  });

  String code;
  String title;
  String description;
  DateTime validFrom;
  DateTime validTo;
  String externalUrl;
  String? logoContent;
  String? categoryCode;
  bool inActive;
  bool activeList;
  String id;
  String createdBy;
  DateTime createdDate;
  String? modifiedBy;
  DateTime? modifiedDate;
  String active;
  String action;
  dynamic validations;

  factory OffersList.fromJson(Map<String, dynamic> json) => OffersList(
        code: json["code"],
        title: json["title"],
        description: json["description"],
        validFrom: DateTime.parse(json["validFrom"]),
        validTo: DateTime.parse(json["validTo"]),
        externalUrl: json["externalUrl"],
        logoContent: json["logoContent"],
        categoryCode: json["categoryCode"],
        inActive: json["inActive"],
        activeList: json["activeList"],
        id: json["id"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"] == null ? null : DateTime.parse(json["modifiedDate"]),
        active: json["active"],
        action: json["action"],
        validations: json["validations"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
        "description": description,
        "validFrom": validFrom.toIso8601String(),
        "validTo": validTo.toIso8601String(),
        "externalUrl": externalUrl,
        "logoContent": logoContent,
        "categoryCode": categoryCode,
        "inActive": inActive,
        "activeList": activeList,
        "id": id,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "active": active,
        "action": action,
        "validations": validations,
      };
}
