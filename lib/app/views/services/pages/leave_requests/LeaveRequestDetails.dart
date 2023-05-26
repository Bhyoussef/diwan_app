import 'package:diwanapp/app/controllers/OffersController.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/LeaveController.dart';
import '../../../../models/leave_model.dart';

class LeaveRequestDetailsScreen extends StatefulWidget {
  final Leave leave;

  const LeaveRequestDetailsScreen({Key? key, required this.leave}) : super(key: key);

  @override
  State<LeaveRequestDetailsScreen> createState() => _LeaveRequestDetailsScreenState();
}

class _LeaveRequestDetailsScreenState extends State<LeaveRequestDetailsScreen> {
  // final controller = Get.put(LeaveController());
  //
  // @override
  // void initState() {
  //   controller.loadLeaveRequestDetails(widget.id);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Leave Request Details'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Get.locale.toString().contains('ar') ?
              widget.leave.nameArb
                  :
              widget.leave.nameEng,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.leave.leaveType,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black45,
              ),
            ),

          ],
        ),
      )
    );
  }
}
