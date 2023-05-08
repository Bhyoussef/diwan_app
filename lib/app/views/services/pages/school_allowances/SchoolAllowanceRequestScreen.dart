import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolAllowanceRequestScreen extends StatelessWidget {
  const SchoolAllowanceRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'school_allowance_request'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
