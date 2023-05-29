import 'package:diwanapp/app/models/leave_model.dart';
import 'package:diwanapp/app/services/leave_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/shared_preferences.dart';

class LeaveController extends GetxController {
  ScrollController scrollController = ScrollController();

  final LeaveService _leaveService = LeaveService();
  late List<Leave> leaveMasterList = <Leave>[].obs;

  // late Leave leaveMasterDetails;
  // var isLoadingDetails = true.obs;


  late Leave selectedMaster;
  String selectedLeaveId = '';
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var remarksController = TextEditingController();
  int leaveDays = -1;
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

  changeMasterSelected(Leave item) {
    isLoadingMaster(true);
    selectedMaster = item;
    selectedLeaveId = item.id;
    print(item.code);
    isLoadingMaster(false);
    update();
  }


  Future saveLeaveRequest() async {
    if(selectedLeaveId == "" ){
      Get.snackbar('leave_request'.tr, 'Select leave type'.tr);


    } else if(leaveDays == -1 || endDateController.text.isEmpty  || startDateController.text.isEmpty || leaveDays <= 0){
      Get.snackbar('leave_request'.tr, 'Select leave dates'.tr);
    } else if( leaveDays > selectedMaster.maxAllowedDays ){
      Get.snackbar('leave_request'.tr, "${'available_leave_days'.tr} ${selectedMaster.maxAllowedDays}");
    } else{
      await _leaveService.saveLeaveRequest(selectedLeaveId,userId,startDateController.text,endDateController.text,remarksController.text);
      reset();
    }
  }

  reset(){
    selectedLeaveId = '';
    leaveDays = -1;
    startDateController.clear();
    endDateController.clear();
    remarksController.clear();

  }


  // Future loadLeaveRequestDetails(id) async {
  //   isLoadingDetails(true);
  //   var response = await _leaveService.getLeaveRequestDetails(id);
  //
  //   if (response != null) {
  //     isLoadingDetails(false);
  //     leaveMasterDetails = response;
  //
  //     update();
  //   }
  //   isLoadingDetails(false);
  // }




}
