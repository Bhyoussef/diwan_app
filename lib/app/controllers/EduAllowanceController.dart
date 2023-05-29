import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/edu_allowance_model.dart';
import '../services/edu_allowance_service.dart';

class EduAllowanceController extends GetxController {
  ScrollController scrollController = ScrollController();
  late List<EduAllowanceModel> eduAllowanceMasterList = <EduAllowanceModel>[].obs;
  var isLoadingEduAllowanceMasterList = false.obs;
  String selectedEduAllowanceId = '';
  late EduAllowanceModel selectedEduAllowance;
  final EduAllowanceService _eduAllowanceService = EduAllowanceService();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var remarksController = TextEditingController();

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
    print(item.code);
    isLoadingEduAllowanceMasterList(false);
    update();
  }



}