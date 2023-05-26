import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveRequestListScreen extends StatefulWidget {
  const LeaveRequestListScreen({super.key});

  @override
  State<LeaveRequestListScreen> createState() => _LeaveRequestListScreenState();
}

class _LeaveRequestListScreenState extends State<LeaveRequestListScreen> {






  @override
  void initState() {
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
      body: Container(),
    );
  }
}
