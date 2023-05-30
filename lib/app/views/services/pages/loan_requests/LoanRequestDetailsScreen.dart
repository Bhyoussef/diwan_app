import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/LoanController.dart';
import '../../../../theme/app_colors.dart';

class LoadRequestDetailsScreen extends StatefulWidget {
  const LoadRequestDetailsScreen({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  State<LoadRequestDetailsScreen> createState() => _LoadRequestDetailsScreenState();
}

class _LoadRequestDetailsScreenState extends State<LoadRequestDetailsScreen> {

  final controller = Get.put(LoanController());

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.loadRequestDetailsById(widget.id);
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loan Request Details'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      body: Obx(
            () => controller.isLoadingLoanDetails.isTrue
            ? const Center(
          child: CircularProgressIndicator(
            backgroundColor: AppColor.primaryRedColor,
          ),
        )
            : controller.loanDetailsModel != null
            ? Container(
          margin: const EdgeInsets.only(bottom: 25),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.loanDetailsModel!.status,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.circle,color: controller.loanDetailsModel!.active == "Y" ?  Colors.green :Colors.red)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Requested Amount".tr,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.loanDetailsModel!.requestedAmount.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Approved Amount".tr,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.loanDetailsModel!.approvedAmount.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start Date".tr,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          DateFormat('yyyy-MM-dd - h:mm').format(
                            controller.loanDetailsModel!.startDate,
                          ),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  Text(
                    controller.loanDetailsModel!.remarks,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  )

                ],
              ),
            ),
          ),
        ) : Center(
          child: Text('Failed to load loan request details'.tr)
        )
      )
    );
  }
}
