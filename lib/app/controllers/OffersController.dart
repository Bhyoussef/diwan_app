import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/models/offers_list_model.dart';
import 'package:diwanapp/app/services/offers_service.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  final OffersService _offerService = OffersService();

  late List<OffersList> offersList = <OffersList>[].obs;
  late OffersList offerDetails;

  var isLoading = false.obs;
  var isLoadingDetails = false.obs;

  Future loadAllOffers() async {
    isLoading(true);
    var response = await _offerService.getOffersList();

    if (response != null) {
      for (var offer in response) {
        offersList.add(offer);
      }
    }
    isLoading(false);
  }

  Future loadOfferDetails(id) async {
    isLoadingDetails(true);
    var response = await _offerService.getOfferDetails(id);

    if (response != null) {
      isLoadingDetails(false);
      offerDetails = response[0];

      update();
    }
    isLoadingDetails(false);
  }
}
