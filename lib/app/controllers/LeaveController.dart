import 'package:diwanapp/app/models/leave_master_model.dart';
import 'package:diwanapp/app/models/leave_model.dart';
import 'package:diwanapp/app/services/leave_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/shared_preferences.dart';

class LeaveController extends GetxController {
  var initial = true.obs;
  ScrollController scrollController = ScrollController();

  final LeaveService _leaveService = LeaveService();
  late List<LeaveMaster> leaveMasterList = <LeaveMaster>[].obs;
  late List<Leave> leaveList = <Leave>[].obs;

  late LeaveMaster selectedMaster;
  String selectedLeaveId = '';

  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var remarksController = TextEditingController();

  int leaveDays = -1;
  var isLoading = false.obs;
  var isLoadingMaster = false.obs;
  String userId = '';

  @override
  void onInit() {
    SharedData.getFromStorage('EMPLOYEE_ID', 'string').then((id) async {
      userId = id;
    });

    super.onInit();
  }

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

  Future loadAllLeaveList() async {
    isLoading(true);
    SharedData.getFromStorage('EMPLOYEE_ID', 'string').then((id) async {
      var response = await _leaveService.getMyLeaveApprovedList(id);

      if (response != null) {
        for (var leave in response) {
          leaveList.add(leave);
        }
      }
      isLoading(false);
    });
  }

  changeMasterSelected(LeaveMaster item) {
    isLoadingMaster(true);
    selectedMaster = item;
    selectedLeaveId = item.id;
    isLoadingMaster(false);
    update();
  }

  Future saveLeaveRequest() async {
    initial(false);
    if (selectedLeaveId == "") {
      //Get.snackbar('leave_request'.tr, 'Select leave type'.tr);
    } else if (leaveDays == -1 ||
        endDateController.text.isEmpty ||
        startDateController.text.isEmpty ||
        leaveDays <= 0) {
      //Get.snackbar('leave_request'.tr, 'Select leave dates'.tr);
    } else if (leaveDays > selectedMaster.maxAllowedDays) {
      Get.snackbar('leave_request'.tr,
          "${'available_leave_days'.tr} ${selectedMaster.maxAllowedDays}");
    } else {
      await _leaveService.saveLeaveRequest(
          selectedLeaveId,
          userId,
          startDateController.text,
          endDateController.text,
          remarksController.text);
      reset();
    }
  }

  reset() {
    initial(true);
    selectedLeaveId = '';
    leaveDays = -1;
    startDateController.clear();
    endDateController.clear();
    remarksController.clear();
  }
}
