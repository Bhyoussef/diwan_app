import 'dart:io';

import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/models/hr_type_list.dart';
import 'package:diwanapp/app/services/certificate_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CertificatesController extends GetxController {
  final CertificateService _certificateService = CertificateService();

  late List<HrTypeList> typesList = <HrTypeList>[].obs;

  var isLoadingPayslip = false.obs;
  var isLoadingSalaryCertificate = false.obs;
  var isLoadingTypes = false.obs;
  var isLoadingHrCertificate = false.obs;

  String userId = '';

  @override
  void onInit() {
    SharedData.getFromStorage('EMPLOYEE_ID', 'string').then((id) async {
      userId = id;
    });

    super.onInit();
  }

  Future loadPaySlipPdf(date) async {
    isLoadingPayslip(true);
    var year = date.year;
    var month = date.month;

    var fileBlob;
    await _certificateService.getEmployeePaySlip(year, month, userId).then(
      (data) {
        fileBlob = data;
      },
    );
    if (fileBlob != null) {
      isLoadingPayslip(false);
      return _storeFile('PaySlip.pdf', fileBlob);
    } else {
      isLoadingPayslip(false);
      Get.snackbar(
        'Error'.tr,
        'No PaySlip ...'.tr,
        colorText: Colors.white,
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  }

  Future loadSalaryCertificatePdf() async {
    isLoadingSalaryCertificate(true);
    var fileBlob;

    await _certificateService.getSalaryCertificate(userId).then(
      (data) {
        fileBlob = data;
      },
    );

    if (fileBlob != null) {
      isLoadingSalaryCertificate(false);
      return _storeFile('SalaryCertificate.pdf', fileBlob);
    } else {
      isLoadingSalaryCertificate(false);
      Get.snackbar(
        'Error'.tr,
        'No Salary Certificate ...'.tr,
        colorText: Colors.white,
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  }

  Future loadAllTypes() async {
    isLoadingTypes(true);

    typesList.clear();
    update();

    var response = await _certificateService.getHryCertificateTypes(userId);
    if (response != null) {
      for (var type in response) {
        typesList.add(type);
      }
    }

    isLoadingTypes(false);
  }

  Future loadHrCertificatePdf(id) async {
    var fileBlob;
    isLoadingHrCertificate(true);
    await _certificateService.getHrCertificate(id).then(
      (data) {
        fileBlob = data;
      },
    );

    if (fileBlob != null) {
      isLoadingHrCertificate(false);
      return _storeFile('HrCertificate.pdf', fileBlob);
    } else {
      isLoadingHrCertificate(false);
      Get.snackbar('Error'.tr, 'No Hr $id Certificate ...'.tr,
          colorText: Colors.white,
          backgroundColor: Colors.amber,
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<File> _storeFile(String fileName, List<int> bytes) async {
    final filename = basename(fileName);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
