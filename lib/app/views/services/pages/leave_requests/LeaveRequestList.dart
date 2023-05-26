import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../../../controllers/LeaveController.dart';
import 'LeaveRequestDetails.dart';

class LeaveRequestList extends StatefulWidget {
  const LeaveRequestList({super.key});

  @override
  State<LeaveRequestList> createState() => _LeaveRequestListState();
}

class _LeaveRequestListState extends State<LeaveRequestList> {

  final controller = Get.put(LeaveController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.leaveMasterList.clear();
      controller.loadAllLeaveMasters();
    });

    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'vacations'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.leaveRequestScreen);

        },
        backgroundColor: AppColor.primaryBlueColor,
        child: const Icon(Icons.add),
      ),
      body: Obx(
            () => controller.isLoadingMaster.isTrue
            ? const Center(
          child: CircularProgressIndicator(
            backgroundColor: AppColor.primaryRedColor,
          ),
        )
            : controller.leaveMasterList.isNotEmpty
            ? Container(
          margin: const EdgeInsets.only(bottom: 25),
          child: ListView.separated(
            itemCount: controller.leaveMasterList.length,
            itemBuilder: (listContext, index) {
              var leaveMaster = controller.leaveMasterList[index];

              return Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 16,
                  right: 16,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => LeaveRequestDetailsScreen(leave: leaveMaster));
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
                          Text(
                            Get.locale.toString().contains('ar') ?
                            leaveMaster.nameArb
                                :
                            leaveMaster.nameEng,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            leaveMaster.leaveType,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black45,
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment:
                          //   MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       DateFormat('yyyy-MM-dd - h:mm')
                          //           .format(
                          //         leaveMaster.createdDate,
                          //       ),
                          //       style: const TextStyle(
                          //         color: Colors.black87,
                          //       ),
                          //     ),
                          //     const Icon(
                          //       Icons.arrow_circle_left_outlined,
                          //     ),
                          //     Text(
                          //       DateFormat('yyyy-MM-dd - h:mm')
                          //           .format(leaveMaster.modifiedDate),
                          //       style: const TextStyle(
                          //         color: Colors.black87
                          //       ),
                          //     ),
                          //   ],
                          // )
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
          child: Text('Leave list is empty'.tr),
        ),
      ),
    );
  }
}
