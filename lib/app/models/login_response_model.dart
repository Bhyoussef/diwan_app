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
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String token;
  late final String employeeId;
  late final String language;
  late final bool isQatari;
  late final bool isManager;
  late final List<UserRoles> userRoles;

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    token = json['token'];
    employeeId = json['employeeId'];
    language = json['language'];
    isQatari = json['isQatari'];
    isManager = json['isManager'];
    userRoles =
        List.from(json['userRoles']).map((e) => UserRoles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['token'] = token;
    data['employeeId'] = employeeId;
    data['language'] = language;
    data['isQatari'] = isQatari;
    data['isManager'] = isManager;
    data['userRoles'] = userRoles.map((e) => e.toJson()).toList();
    return data;
  }
}

class UserRoles {
  UserRoles({
    required this.roleCode,
    required this.roleName,
    required this.accessCode,
    required this.accessName,
    required this.allowWrite,
    required this.allowEdit,
    required this.allowDelete,
    required this.allowApprove,
  });
  late final String roleCode;
  late final String roleName;
  late final String accessCode;
  late final String accessName;
  late final String allowWrite;
  late final String allowEdit;
  late final String allowDelete;
  late final String allowApprove;

  UserRoles.fromJson(Map<String, dynamic> json) {
    roleCode = json['roleCode'];
    roleName = json['roleName'];
    accessCode = json['accessCode'];
    accessName = json['accessName'];
    allowWrite = json['allowWrite'];
    allowEdit = json['allowEdit'];
    allowDelete = json['allowDelete'];
    allowApprove = json['allowApprove'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['roleCode'] = roleCode;
    data['roleName'] = roleName;
    data['accessCode'] = accessCode;
    data['accessName'] = accessName;
    data['allowWrite'] = allowWrite;
    data['allowEdit'] = allowEdit;
    data['allowDelete'] = allowDelete;
    data['allowApprove'] = allowApprove;
    return data;
  }
}
