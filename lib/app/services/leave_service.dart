import 'package:diwanapp/app/models/leave_approvel_model.dart';
import 'package:diwanapp/app/models/leave_model.dart';
import 'package:diwanapp/app/services/base_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class LeaveService extends GetxService {
  Future getLeaveMasters() async {
    try {
      Dio.Response response = await dio().get(
        '/mobileservice/leaveMasterList'
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<Leave> leaveList = [];
        leaveList = responseData.map((json) => Leave.fromJson(json)).toList();
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

  Future getMyLeaveApprovelList(userId) async {
    try {
      Dio.Response response = await dio().get(
        '/mobileservice/getMyLeaveApprovelList?employeeId=$userId',
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<LeaveApprovel> approvelList = [];
        approvelList =
            responseData.map((json) => LeaveApprovel.fromJson(json)).toList();
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
}
