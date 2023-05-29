import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/EduAllowanceController.dart';

class SchoolAllowanceListScreen extends StatefulWidget {
  const SchoolAllowanceListScreen({super.key});

  @override
  State<SchoolAllowanceListScreen> createState() =>
      _SchoolAllowanceListScreenState();
}

class _SchoolAllowanceListScreenState extends State<SchoolAllowanceListScreen> {
  final controller = Get.put(EduAllowanceController());

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.myEduAllowanceList.clear();
      controller.loadEduAllowance();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'school_allowance'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.schoolAllowanceScreen);
        },
        backgroundColor: AppColor.primaryBlueColor,
        child: const Icon(Icons.add),
      ),
      body: Obx(
            () => controller.isLoadingEduAllowanceList.isTrue
            ? const Center(
          child: CircularProgressIndicator(
            backgroundColor: AppColor.primaryRedColor,
          ),
        )
            : controller.myEduAllowanceList.isNotEmpty
            ? Container(
          margin: const EdgeInsets.only(bottom: 25),
          child: ListView.separated(
            itemCount: controller.myEduAllowanceList.length,
            itemBuilder: (listContext, index) {
              var eduAllowance = controller.myEduAllowanceList[index];

              return Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 16,
                  right: 16,
                ),
                child: GestureDetector(
                  onTap: () {
                    //Get.to(() => LeaveRequestDetailsScreen(leave: eduAllowance));
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

                            eduAllowance.name
                               ,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            eduAllowance.type,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            eduAllowance.componentCode,
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
          child: Text('School allowance list is empty'.tr),
        ),
      ),
    );
  }
}
