import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/shared_preferences.dart';
import '../models/edu_allowance_model.dart';
import '../services/edu_allowance_service.dart';

class EduAllowanceController extends GetxController {
  ScrollController scrollController = ScrollController();
  late List<EduAllowanceModel> myEduAllowanceList = <EduAllowanceModel>[].obs;
  var isLoadingEduAllowanceList = false.obs;

  late List<EduAllowanceModel> eduAllowanceMasterList = <EduAllowanceModel>[].obs;
  var isLoadingEduAllowanceMasterList = false.obs;

  String selectedEduAllowanceId = '';
  int leaveDays = -1;
  late EduAllowanceModel selectedEduAllowance;
  final EduAllowanceService _eduAllowanceService = EduAllowanceService();
  var startDateController = TextEditingController();

  var remarksController = TextEditingController();


  String userId = '';

  @override
  void onInit() {
    SharedData.getFromStorage('EMPLOYEE_ID', 'string').then((id) async {
      userId = id;
    });

    super.onInit();
  }

  Future loadEduAllowance() async {
    isLoadingEduAllowanceList(true);

    SharedData.getFromStorage('EMPLOYEE_ID', 'string').then((id) async {
      var response = await _eduAllowanceService.getMyEduAllowanceList(id);

      if (response != null) {
        for (var eduAllowance in response) {
          myEduAllowanceList.add(eduAllowance);
        }
      }
      isLoadingEduAllowanceList(false);
    });
  }

  Future getEduAllowanceMastersList() async {
    isLoadingEduAllowanceMasterList(true);
    var response = await _eduAllowanceService.getEduAllowanceMasterList();

    if (response != null) {
      for (var eduAllowance in response) {
        eduAllowanceMasterList.add(eduAllowance);
      }
    }
    isLoadingEduAllowanceMasterList(false);
  }
  changeEduAllowanceSelected(EduAllowanceModel item) {
    isLoadingEduAllowanceMasterList(true);
    selectedEduAllowance = item;
    selectedEduAllowanceId = item.id;
    isLoadingEduAllowanceMasterList(false);
    update();
  }



  Future saveEduAllowanceRequest() async {
    if(selectedEduAllowanceId == "" ) {
      Get.snackbar('Edu Allowance'.tr, 'Select Edu Allowance'.tr);


    }  else if( leaveDays > selectedEduAllowance.maxAllowed ){
      Get.snackbar('Edu Allowance'.tr, "${'Max allowed days'.tr} ${selectedEduAllowance.maxAllowed}");
    } else{
      await _eduAllowanceService.saveEduAllowanceRequest(selectedEduAllowanceId,userId,startDateController.text,"0",remarksController.text);
      reset();
    }
  }

  reset(){
    selectedEduAllowanceId = '';
    leaveDays = -1;
    startDateController.clear();
    remarksController.clear();

  }



}