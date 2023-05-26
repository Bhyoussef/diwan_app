import 'package:diwanapp/app/models/leave_model.dart';
import 'package:diwanapp/app/services/leave_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class LeaveController extends GetxController {
  final LeaveService _leaveService = LeaveService();
  late List<Leave> leaveMasterList = <Leave>[].obs;

  ScrollController scrollController = ScrollController();
  late Leave selectedMaster;
  String slectedLeaveId = '';



  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var remarksController = TextEditingController();

  int leaveDays = -1;

  var isLoadingMaster = false.obs;

  Future loadAllLeaveMasters() async {
    isLoadingMaster(true);
    var response = await _leaveService.getLeaveMasters();

    if (response != null) {
      for (var course in response) {
        leaveMasterList.add(course);
      }
    }
    isLoadingMaster(false);
  }

  changeMasterSelected(Leave item) {
    isLoadingMaster(true);
    selectedMaster = item;
    slectedLeaveId = item.id;
    print(item.code);
    isLoadingMaster(false);
    update();
  }




}
