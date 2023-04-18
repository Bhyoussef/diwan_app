import 'package:diwanapp/app/models/hr_type_list.dart';
import 'package:diwanapp/app/services/base_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class CertificateService extends GetxService {
  Future getEmployeePaySlip(year, month, userId) async {
    final body = {
      "employeeId": userId,
      "month": month,
      "year": year,
    };

    try {
      Dio.Response response = await dio().post(
        '/mobileservice/getEmployeePaySlip',
        data: body,
        options: Dio.Options(responseType: Dio.ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        return response.data;
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

  Future getSalaryCertificate(userId) async {
    try {
      Dio.Response response = await dio().post(
        '/mobileservice/getEmployeeSalaryCertificate?employeeId=$userId',
        options: Dio.Options(responseType: Dio.ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        return response.data;
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

  Future getHryCertificateTypes(userId) async {
    try {
      Dio.Response response = await dio().get(
        '/mobileservice/getRequestedHrCertificateList/$userId',
      );

      if (response.statusCode == 200) {
        return hrTypeListFromJson(response.data);
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

  Future getHrCertificate(typeId) async {
    try {
      Dio.Response response = await dio().post(
        '/mobileservice/getdownloadRequestedCertificate?CertificateID=$typeId',
        options: Dio.Options(responseType: Dio.ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
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
