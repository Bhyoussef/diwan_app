import 'package:diwanapp/app/models/course_details.dart';
import 'package:diwanapp/app/models/courses_list_model.dart';
import 'package:diwanapp/app/services/base_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class CouresService extends GetxService {
  Future getCoursesList(userId) async {
    try {
      Dio.Response response = await dio().get(
        '/mobileservice//getEmployeeExternalCourseList?employeeId=$userId',
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;

        print(responseData);
        List<CoursesList> coursesList = [];
        coursesList =
            responseData.map((json) => CoursesList.fromJson(json)).toList();
        return coursesList;
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

  Future getCourseDetails(id) async {
    try {
      Dio.Response response = await dio().post(
        '/mobileservice/getExternalCourseDetails?courseID=$id',
      );

      if (response.statusCode == 200) {
        return CoursesDetails.fromJson(response.data);
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
