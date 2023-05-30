import 'package:diwanapp/app/models/leave_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveRequestDetailsScreen extends StatefulWidget {
  final Leave leave;

  const LeaveRequestDetailsScreen({Key? key, required this.leave})
      : super(key: key);

  @override
  State<LeaveRequestDetailsScreen> createState() =>
      _LeaveRequestDetailsScreenState();
}

class _LeaveRequestDetailsScreenState extends State<LeaveRequestDetailsScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.leave.active,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.leave.active,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ));
  }
}
