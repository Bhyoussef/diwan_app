import 'package:diwanapp/app/controllers/CourseController.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CourseDetailsScreen extends StatefulWidget {
  final String id;

  const CourseDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  final controller = Get.put(CourseController());

  @override
  void initState() {
    controller.loadCourseDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'course_details'.tr,
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
                      controller.courseDetails.title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.courseDetails.description,
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
                            controller.courseDetails.startDate,
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
                            controller.courseDetails.endDate,
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
