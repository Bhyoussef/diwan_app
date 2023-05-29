import 'package:diwanapp/app/services/base_client.dart';

import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';

import '../models/edu_allowance_model.dart';

class EduAllowanceService extends GetxService {



  Future getEduAllowanceMasterList() async {
    try {
      Dio.Response response = await dio().get(
          '/mobileservice/getEduAllowanceMasterList'
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<EduAllowanceModel> eduAllowanceMasterList = [];
        eduAllowanceMasterList = responseData.map((json) => EduAllowanceModel.fromJson(json)).toList();
        return eduAllowanceMasterList;
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