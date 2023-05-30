import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:diwanapp/app/models/loan_model.dart';
import 'package:diwanapp/app/services/base_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

import '../models/loan_details_model.dart';
import '../models/loan_types_model.dart';
import '../routes/app_pages.dart';

class LoanService extends GetxService {
  Future getMyLoanList(userId) async {
    try {
      Dio.Response response = await dio().post(
        '/mobileservice/getLoanRequestList?employeeId=$userId',
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<Loan> approvelList = [];
        approvelList = responseData.map((json) => Loan.fromJson(json)).toList();
        return approvelList;
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

  Future getLoanRequestDetailsById(id) async {
    try {
      Dio.Response response = await dio().get(
        '/mobileservice/getLoanRequestById/$id',
      );

      if (response.statusCode == 200) {
        final responseData = LoanDetailsModel.fromJson(response.data);

        return responseData;
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


  Future getLoanTypes() async {
    try {
      Dio.Response response = await dio().get('/mobileservice/getLangBasedDataForLoanMaster');

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<LoanTypesModel> loanTypesList = [];
        loanTypesList =
            responseData.map((json) => LoanTypesModel.fromJson(json)).toList();
        return loanTypesList;
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

  Future saveLoanRequest(
      leaveMasterId, employeeId, requestedAmount, noOfInstallment, remarks) async {
    final body = {
      "loandMasterId": leaveMasterId,
      "employeeId": employeeId,
      "requestedAmount": requestedAmount,
      "noOfInstallment": noOfInstallment,
      "remarks": remarks,
    };

    try {
      Dio.Response response = await dio().post(
        '/mobileservice/saveLoanRequest',
        data: jsonEncode(body),
        options: Dio.Options(responseType: Dio.ResponseType.bytes, headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      log(body.toString());
      if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.homeScreen);
        Get.snackbar('Loan Request'.tr, 'Loan request saved'.tr);
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
