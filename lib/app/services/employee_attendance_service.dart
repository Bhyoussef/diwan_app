import 'package:diwanapp/app/models/employee_attendance_model.dart';
import 'package:diwanapp/app/services/base_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class EmployeeAttendancesService extends GetxService {
  Future getEmployeeAttendanceList(year, month, userId) async {
    final body = {
      "employeeID": "16b7f074-f44c-4906-b5b5-44cf6114ed27",
      "month": month,
      "year": year,
    };

    print(body);
    try {
      Dio.Response response = await dio().post(
        '/mobileservice/getEmployeeAttendancePerMonth',
        data: body,
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<EmployeeAttendanceModel> employeeAttendance = [];
        employeeAttendance = responseData
            .map((json) => EmployeeAttendanceModel.fromJson(json))
            .toList();
        return employeeAttendance;
      } else {
        return null;
      }
    } on Dio.DioError catch (e) {
      // Backend Form Validation Error
      if (e.type == Dio.DioErrorType.unknown) {
        Get.snackbar('Server Error'.tr, 'A network error occurred'.tr);
      }
      return null;
    }
  }
}
