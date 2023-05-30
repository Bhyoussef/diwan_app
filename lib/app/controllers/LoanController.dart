import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/models/loan_model.dart';
import 'package:diwanapp/app/services/loan_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/loan_details_model.dart';

class LoanController extends GetxController {
  ScrollController scrollController = ScrollController();

  final LoanService _loanService = LoanService();
  late List<Loan> loanList = <Loan>[].obs;
  var isLoading = false.obs;

  String userId = '';

  late LoanDetailsModel? loanDetailsModel;
  var isLoadingLoanDetails = false.obs;

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
}
