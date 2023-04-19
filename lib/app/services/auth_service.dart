import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/models/login_response_model.dart';
import 'package:diwanapp/app/services/base_client.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as Dio;

class AuthService extends GetxService {
  Future login({required qid, password}) async {
    final credentials = {
      "userName": qid,
      "ssoUserName": "",
      "passWord": password
    };

    try {
      Dio.Response response =
          await dio().post('/mobileservice/userLogin', data: credentials);

      if (response.statusCode == 200) {
        final user = loginModelFromJson(response.data);
        //Save User data to LocalStorage
        SharedData.saveToStorage('USER_TOKEN', user.token, 'string');
        SharedData.saveToStorage('EMPLOYEE_ID', user.employeeId, 'string');
        SharedData.saveToStorage('CONNECTED', true, 'bool');
        SharedData.saveToStorage('IS_QATARI', user.isQatari, 'bool');
        SharedData.saveToStorage('IS_MANAGER', user.isManager, 'bool');

        return true;
      } else {
        return false;
      }
    } on Dio.DioError catch (e) {
      // Backend Form Validation Error
      if (e.type == Dio.DioErrorType.unknown) {
        Get.snackbar('Server Error'.tr, 'A network error occurred'.tr);
      }
      return false;
    }
  }
}
