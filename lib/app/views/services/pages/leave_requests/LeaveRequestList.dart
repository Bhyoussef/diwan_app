import 'package:diwanapp/app/controllers/LeaveController.dart';
import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadAllLeaveList();
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
        () => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.primaryRedColor,
                ),
              )
            : controller.leaveList.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: ListView.separated(
                      itemCount: controller.leaveList.length,
                      itemBuilder: (listContext, index) {
                        var leave = controller.leaveList[index];

                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            left: 16,
                            right: 16,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() =>
                                  LeaveRequestDetailsScreen(leave: leave));
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
                                      leave.empName,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      leave.status,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black45,
                                      ),
                                    ),
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
