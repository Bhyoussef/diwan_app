import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolAllowanceListScreen extends StatefulWidget {
  const SchoolAllowanceListScreen({super.key});

  @override
  State<SchoolAllowanceListScreen> createState() =>
      _SchoolAllowanceListScreenState();
}

class _SchoolAllowanceListScreenState extends State<SchoolAllowanceListScreen> {
  @override
  void initState() {
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
      body: Container(),
    );
  }
}
