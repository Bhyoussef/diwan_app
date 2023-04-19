import 'dart:convert';

import 'package:diwanapp/app/controllers/OffersController.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/views/services/pages/offers/OfferDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final controller = Get.put(OffersController());

  @override
  void initState() {
    controller.loadAllOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'offers'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.primaryRedColor,
                ),
              )
            : controller.offersList.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: ListView.separated(
                      itemCount: controller.offersList.length,
                      itemBuilder: (listContext, index) {
                        var offer = controller.offersList[index];

                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            left: 16,
                            right: 16,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => OfferDetailsScreen(id: offer.id));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    offer.logoContent == null
                                        ? Container()
                                        : Image.memory(
                                            Base64Decoder()
                                                .convert(offer.logoContent),
                                          ),
                                    Text(
                                      offer.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      offer.description,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DateFormat('yyyy-MM-dd - h:mm')
                                              .format(
                                            offer.validFrom,
                                          ),
                                          style: const TextStyle(
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_circle_left_outlined,
                                        ),
                                        Text(
                                          DateFormat('yyyy-MM-dd - h:mm')
                                              .format(
                                            offer.validTo,
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
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 0),
                    ),
                  )
                : Center(
                    child: Text('Offers list is empty'.tr),
                  ),
      ),
    );
  }
}
