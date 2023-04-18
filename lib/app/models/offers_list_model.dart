import 'dart:convert';

List<OffersList> offersListFromJson(String str) =>
    List<OffersList>.from(json.decode(str).map((x) => OffersList.fromJson(x)));

String offersListToJson(List<OffersList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  dynamic logoContent;
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
        code: json["Code"],
        title: json["Title"],
        description: json["Description"],
        validFrom: DateTime.parse(json["ValidFrom"]),
        validTo: DateTime.parse(json["ValidTo"]),
        externalUrl: json["ExternalUrl"],
        logoContent: json["LogoContent"],
        categoryCode: json["CategoryCode"],
        inActive: json["InActive"],
        activeList: json["ActiveList"],
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
        "Code": code,
        "Title": title,
        "Description": description,
        "ValidFrom": validFrom.toIso8601String(),
        "ValidTo": validTo.toIso8601String(),
        "ExternalUrl": externalUrl,
        "LogoContent": logoContent,
        "CategoryCode": categoryCode,
        "InActive": inActive,
        "ActiveList": activeList,
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
