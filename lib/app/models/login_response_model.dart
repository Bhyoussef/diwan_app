import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

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
  List<UserRole> userRoles;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        token: json["Token"],
        employeeId: json["EmployeeId"],
        language: json["Language"],
        isQatari: json["IsQatari"],
        isManager: json["IsManager"],
        userRoles: List<UserRole>.from(
            json["UserRoles"].map((x) => UserRole.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "Token": token,
        "EmployeeId": employeeId,
        "Language": language,
        "IsQatari": isQatari,
        "IsManager": isManager,
        "UserRoles": List<dynamic>.from(userRoles.map((x) => x.toJson())),
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

  RoleCode roleCode;
  RoleName roleName;
  String accessCode;
  String accessName;
  Allow allowWrite;
  Allow allowEdit;
  Allow allowDelete;
  Allow allowApprove;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        roleCode: roleCodeValues.map[json["RoleCode"]]!,
        roleName: roleNameValues.map[json["RoleName"]]!,
        accessCode: json["AccessCode"],
        accessName: json["AccessName"],
        allowWrite: allowValues.map[json["AllowWrite"]]!,
        allowEdit: allowValues.map[json["AllowEdit"]]!,
        allowDelete: allowValues.map[json["AllowDelete"]]!,
        allowApprove: allowValues.map[json["AllowApprove"]]!,
      );

  Map<String, dynamic> toJson() => {
        "RoleCode": roleCodeValues.reverse[roleCode],
        "RoleName": roleNameValues.reverse[roleName],
        "AccessCode": accessCode,
        "AccessName": accessName,
        "AllowWrite": allowValues.reverse[allowWrite],
        "AllowEdit": allowValues.reverse[allowEdit],
        "AllowDelete": allowValues.reverse[allowDelete],
        "AllowApprove": allowValues.reverse[allowApprove],
      };
}

enum Allow { Y }

final allowValues = EnumValues({"Y": Allow.Y});

enum RoleCode { SUPERADMIN }

final roleCodeValues = EnumValues({"SUPERADMIN": RoleCode.SUPERADMIN});

enum RoleName { SUPER_ADMIN }

final roleNameValues = EnumValues({"Super Admin": RoleName.SUPER_ADMIN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
