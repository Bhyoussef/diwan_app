import 'package:diwanapp/app/models/loan_model.dart';
import 'package:diwanapp/app/services/base_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

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
}
