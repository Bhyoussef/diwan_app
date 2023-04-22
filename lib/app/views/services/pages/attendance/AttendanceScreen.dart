import 'package:diwanapp/app/controllers/EmployeeAttendanceController.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/views/services/pages/courses/CourseDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final controller = Get.put(EmployeeAttendanceController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employee Attendance'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
            onPressed: () async {
              final localeObj = Locale('en');
              final selected = await showMonthYearPicker(
                context: context,
                initialDate: DateTime(2022),
                firstDate: DateTime(2022),
                lastDate: DateTime(2024),
                locale: localeObj,
              );
              if (selected != null) {
                final file =
                    await controller.loadAllEmployeeAttendance(selected);
              }
            },
          )
        ],
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.primaryRedColor,
                ),
              )
            : controller.employeeAttendanceList.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: ListView.separated(
                      itemCount: controller.employeeAttendanceList.length,
                      itemBuilder: (listContext, index) {
                        var attendance =
                            controller.employeeAttendanceList[index];

                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            left: 16,
                            right: 16,
                          ),
                          child: GestureDetector(
                            onTap: () {},
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
                                      children: [
                                        const Text(
                                          "Early Out: ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          attendance.isEarlyOut.toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Late In: ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          attendance.isLateIn.toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
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
                    child: Text('Attendance list is empty'.tr),
                  ),
      ),
    );
  }
}
