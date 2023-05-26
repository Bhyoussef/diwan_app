// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.token,
    required this.employeeId,
    required this.language,
    required this.isQatari,
    required this.isManager,
    required this.photoUrl,
    required this.userRoles,
  });

  String id;
  String firstName;
  String lastName;
  String token;
  String employeeId;
  String language;
  bool isQatari;
  bool isManager;
  String photoUrl;
  List<UserRole> userRoles;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    token: json["token"],
    employeeId: json["employeeId"],
    language: json["language"],
    isQatari: json["isQatari"],
    isManager: json["isManager"],
    photoUrl: json["photoURL"] ?? "",
    userRoles: List<UserRole>.from(json["userRoles"].map((x) => UserRole.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "token": token,
    "employeeId": employeeId,
    "language": language,
    "isQatari": isQatari,
    "isManager": isManager,
    "photoURL": photoUrl,
    "userRoles": List<dynamic>.from(userRoles.map((x) => x.toJson())),
  };
}

class UserRole {
  UserRole({
    required this.roleCode,
    required this.roleName,
    required this.accessCode,
    required this.accessName,
    required this.allowWrite,
    required this.allowEdit,
    required this.allowDelete,
    required this.allowApprove,
  });

  String roleCode;
  String roleName;
  String accessCode;
  String accessName;
  String allowWrite;
  String allowEdit;
  String allowDelete;
  String allowApprove;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
    roleCode: json["roleCode"],
    roleName: json["roleName"],
    accessCode: json["accessCode"],
    accessName: json["accessName"],
    allowWrite: json["allowWrite"],
    allowEdit: json["allowEdit"],
    allowDelete: json["allowDelete"],
    allowApprove: json["allowApprove"],
  );

  Map<String, dynamic> toJson() => {
    "roleCode": roleCode,
    "roleName": roleName,
    "accessCode": accessCode,
    "accessName": accessName,
    "allowWrite": allowWrite,
    "allowEdit": allowEdit,
    "allowDelete": allowDelete,
    "allowApprove": allowApprove,
  };
}
