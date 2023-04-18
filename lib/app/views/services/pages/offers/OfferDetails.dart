import 'package:diwanapp/app/controllers/OffersController.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OfferDetailsScreen extends StatefulWidget {
  final String id;

  const OfferDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  final controller = Get.put(OffersController());

  @override
  void initState() {
    controller.loadOfferDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'offer details'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoadingDetails.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.primaryRedColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.offerDetails.title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.offerDetails.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black45,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('yyyy-MM-dd - h:mm').format(
                            controller.offerDetails.validFrom,
                          ),
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_circle_left_outlined,
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd - h:mm').format(
                            controller.offerDetails.validTo,
                          ),
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
