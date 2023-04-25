import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/models/employee_attendance_model.dart';
import 'package:diwanapp/app/services/employee_attendance_service.dart';

import 'package:get/get.dart';

class EmployeeAttendanceController extends GetxController {
  final EmployeeAttendancesService _employeeAttendanceService =
      EmployeeAttendancesService();

  late List<EmployeeAttendanceModel> employeeAttendanceList =
      <EmployeeAttendanceModel>[].obs;

  var isLoading = false.obs;

  Future loadAllEmployeeAttendance(date) async {
    var year = date.year;
    var month = date.month;
    isLoading(true);

    SharedData.getFromStorage('EMPLOYEE_ID', 'string').then((id) async {
      var response = await _employeeAttendanceService.getEmployeeAttendanceList(
          year, month, id);

      if (response != null) {
        for (var attendance in response) {
          employeeAttendanceList.add(attendance);
        }
      }
      isLoading(false);
    });
  }
}
