import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/helpers/shared_values.dart';
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
        final LoginModel user = LoginModel.fromJson(response.data);
        SharedData.saveToStorage('USER_TOKEN', user.token, 'string');
        isLoggedIn.$ = true;
        userId.$ = user.employeeId;
        accessToken.$ = user.token;
        isQatari.$ = user.isQatari;
        isManager.$ = user.isManager;
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
