import 'package:diwanapp/app/controllers/CertificatesController.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/views/services/pages/certificates/HRCertificateScreen.dart';
import 'package:diwanapp/app/views/services/pages/certificates/PdfViewerPage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put<CertificatesController>(
      CertificatesController(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'certificates'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: controller.isLoadingPayslip.isTrue
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.primaryRedColor,
                          ),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.primaryRedColor,
                          ),
                        ),
                        onPressed: controller.isLoadingPayslip.isFalse
                            ? () async {
                                const localeObj = Locale('en');
                                final selected = await showMonthYearPicker(
                                  context: context,
                                  initialDate: DateTime(2022),
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2024),
                                  locale: localeObj,
                                );
                                if (selected != null) {
                                  final file =
                                      await controller.loadPaySlipPdf(selected);
                                  if (file != null) {
                                    // ignore: use_build_context_synchronously
                                    openPdf(context, file);
                                  }
                                }
                              }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'pay_slip'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: controller.isLoadingSalaryCertificate.isTrue
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.primaryRedColor,
                          ),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.primaryRedColor,
                          ),
                        ),
                        onPressed: controller.isLoadingSalaryCertificate.isFalse
                            ? () async {
                                final file =
                                    await controller.loadSalaryCertificatePdf();
                                if (file != null) {
                                  // ignore: use_build_context_synchronously
                                  openPdf(context, file);
                                }
                              }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'salary_certificates'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColor.primaryRedColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HRCertificateScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'hr_certificates'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void openPdf(BuildContext context, File file) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => PdfViewerPage(file: file),
    ),
  );
}
