import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/models/loan_model.dart';
import 'package:diwanapp/app/services/loan_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/loan_details_model.dart';
import '../models/loan_types_model.dart';

class LoanController extends GetxController {
  var initial = true.obs;
  ScrollController scrollController = ScrollController();
  var remarksController = TextEditingController();
  var requestedAmountController = TextEditingController();

  final LoanService _loanService = LoanService();
  late List<Loan> loanList = <Loan>[].obs;
  var isLoading = false.obs;
  late List<LoanTypesModel> loanTypesList = <LoanTypesModel>[].obs;
  var isLoadingLoanTypes = false.obs;
  late LoanTypesModel selectedLoanType;
  String selectedLoanTypeId = '';
  String userId = '';
  late LoanDetailsModel? loanDetailsModel;
  var isLoadingLoanDetails = false.obs;
  List<int> numberOfInstallmentList = [12,36,24,48,60];
  String selectedNumberOfInstallment = "";


  @override
  void onInit() {
    SharedData.getFromStorage('EMPLOYEE_ID', 'string').then((id) async {
      userId = id;
    });

    super.onInit();
  }

  Future loadAllLoanTypes() async {
    isLoadingLoanTypes(true);
    var response = await _loanService.getLoanTypes();

    if (response != null) {
      for (var loanType in response) {
        loanTypesList.add(loanType);
      }
    }
    isLoadingLoanTypes(false);
  }

  changeLoanTypeSelected(LoanTypesModel item) {
    isLoadingLoanTypes(true);
    selectedLoanType = item;
    selectedLoanTypeId = item.id;
    isLoadingLoanTypes(false);
    update();
  }


  Future loadAllLoanList() async {
    isLoading(true);
    SharedData.getFromStorage('EMPLOYEE_ID', 'string').then((id) async {
      var response = await _loanService.getMyLoanList(id);

      if (response != null) {
        for (var course in response) {
          loanList.add(course);
        }
      }
      isLoading(false);
    });
  }

  Future loadRequestDetailsById(String id) async {
    loanDetailsModel = null;
    isLoadingLoanDetails(true);
    var response = await _loanService.getLoanRequestDetailsById(id);

    if (response != null) {
      loanDetailsModel = response;
    }
    isLoadingLoanDetails(false);
  }


  Future saveLoanRequest() async {
    initial(false);
    if (selectedLoanTypeId == "") {
      Get.snackbar('Loan Request'.tr, 'Select loan type'.tr);
    } else if (requestedAmountController.text.isEmpty) {
      Get.snackbar('Loan Request'.tr, 'Enter your requested amount'.tr);
    }  else if (double. parse(requestedAmountController.text)  > selectedLoanType.maxAllowed) {
      Get.snackbar('Loan Request'.tr, "${'Max allowed'.tr} ${selectedLoanType.maxAllowed}");
    } else if (selectedNumberOfInstallment == "") {
      Get.snackbar('Loan Request'.tr, "Choose the number of installment");
    } else {
      await _loanService.saveLoanRequest(
          selectedLoanTypeId,
          userId,
          requestedAmountController.text,
          selectedNumberOfInstallment,
          remarksController.text
      );
      reset();
    }
  }
  reset() {

    selectedLoanTypeId = '';
    selectedNumberOfInstallment = '';
    requestedAmountController.clear();
    remarksController.clear();
  }
}
