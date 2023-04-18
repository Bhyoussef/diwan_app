import 'package:diwanapp/app/models/courses_list_model.dart';
import 'package:diwanapp/app/services/base_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class CouresService extends GetxService {
  Future getCoursesList(userId) async {
    try {
      Dio.Response response = await dio().get(
        '/mobileservice/getAllExternalCourseListForMob?employeeId=$userId',
      );

      if (response.statusCode == 200) {
        return coursesListFromJson(response.data);
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
        return coursesListFromJson(response.data);
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
