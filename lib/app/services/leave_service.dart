import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:diwanapp/app/models/leave_approvel_model.dart';
import 'package:diwanapp/app/models/leave_master_model.dart';
import 'package:diwanapp/app/models/leave_model.dart';
import 'package:diwanapp/app/services/base_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

import '../routes/app_pages.dart';

class LeaveService extends GetxService {
  Future getLeaveMasters() async {
    try {
      Dio.Response response = await dio().get('/mobileservice/leaveMasterList');

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<LeaveMaster> leaveList = [];
        leaveList =
            responseData.map((json) => LeaveMaster.fromJson(json)).toList();
        return leaveList;
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

  Future getMyLeaveApprovedList(userId) async {
    try {
      Dio.Response response = await dio().post(
        '/mobileservice/getMyLeaveApprovelList?employeeId=$userId',
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<Leave> approvelList = [];
        approvelList =
            responseData.map((json) => Leave.fromJson(json)).toList();
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

  Future getMyLeaveByMasterId(masterId) async {
    try {
      Dio.Response response = await dio().get(
        '/mobileservice/getMyLeave/$masterId',
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<LeaveApprovel> leavelList = [];
        leavelList =
            responseData.map((json) => LeaveApprovel.fromJson(json)).toList();
        return leavelList;
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

  Future saveLeaveRequest(
      leaveMasterId, employeeId, fromDate, toDate, remarks) async {
    final body = {
      "leaveMasterId": leaveMasterId,
      "employeeId": employeeId,
      "fromDate": DateTime.parse(fromDate).toString(),
      "toDate": DateTime.parse(toDate).toString(),
      "remarks": remarks,
    };

    try {
      Dio.Response response = await dio().post(
        '/mobileservice/saveLeaveRequest',
        data: jsonEncode(body),
        options: Dio.Options(responseType: Dio.ResponseType.bytes, headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.homeScreen);
        Get.snackbar('leave_request'.tr, 'Leave request saved'.tr);
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

  Future getLeaveRequestDetails(id) async {
    try {
      Dio.Response response = await dio().get(
        '/mobileservice/getLeaveById/$id',
      );

      if (response.statusCode == 200) {
        final responseData = response.data as LeaveMaster;

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
}
