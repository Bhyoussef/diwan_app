import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:diwanapp/app/services/base_client.dart';

import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';

import '../models/edu_allowance_model.dart';
import '../routes/app_pages.dart';

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

  Future saveEduAllowanceRequest(selectedEduAllowanceId, employeeId, fromDate,requestedAmount,remarks) async {
    final body = {
      "eduAllowanceMasterId": selectedEduAllowanceId,
      "employeeId": employeeId,
      "requestedAmount": requestedAmount,
      "transDate": DateTime.parse(fromDate).toString(),
      "remarks": remarks,
    };

    try {
      Dio.Response response = await dio().post(
        '/mobileservice/saveEduAllowance',
        data: jsonEncode(body),
        options: Dio.Options(responseType: Dio.ResponseType.bytes, headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );


      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.homeScreen);
        Get.snackbar('Edu Allowance'.tr, 'Edu Allowance request saved'.tr);
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