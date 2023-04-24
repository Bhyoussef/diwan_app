import 'package:diwanapp/app/models/offers_list_model.dart';
import 'package:diwanapp/app/services/base_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class OffersService extends GetxService {
  Future getOffersList() async {
    try {
      Dio.Response response = await dio().get(
        '/mobileservice/getExternalOffersList',
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<OffersList> offersList = [];
        offersList = responseData.map((json) => OffersList.fromJson(json)).toList();
        return offersList;
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

  Future getOfferDetails(id) async {
    try {
      Dio.Response response = await dio().get(
        '/mobileservice/getExternalOffersDetailsList?offerID=$id',
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        List<OffersList> offersList = [];
        offersList = responseData.map((json) => OffersList.fromJson(json)).toList();
        return offersList;
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
