import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../models/edu_allowance_model.dart';

class SchoolAllowanceDetailsScreen extends StatefulWidget {
  const SchoolAllowanceDetailsScreen({Key? key, required this.eduAllowance}) : super(key: key);
  final EduAllowanceModel eduAllowance;

  @override
  State<SchoolAllowanceDetailsScreen> createState() => _SchoolAllowanceDetailsScreenState();
}

class _SchoolAllowanceDetailsScreenState extends State<SchoolAllowanceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'School Allowance Details'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 18,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Get.locale.toString().contains('ar') ?
                    widget.eduAllowance.eduNameAr
                        :
                    widget.eduAllowance.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                Icon(Icons.circle,color: widget.eduAllowance.active == "Y" ?  Colors.green :Colors.red)

                ],
              ),
              Text(
                widget.eduAllowance.type,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black45,
                ),
              ),
              Text(
                widget.eduAllowance.maxAllowed.toString(),
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black45,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('yyyy-MM-dd - h:mm').format(
                      widget.eduAllowance.modifiedDate
                    ),
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

            ],
          ),
        )
    );
  }
}
