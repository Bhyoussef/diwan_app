import 'package:diwanapp/app/controllers/CertificatesController.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/views/services/pages/certificates/PdfViewerPage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

import 'package:month_year_picker/month_year_picker.dart';

class HRCertificateScreen extends StatefulWidget {
  const HRCertificateScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HRCertificateScreen> createState() => _HRCertificateScreenState();
}

class _HRCertificateScreenState extends State<HRCertificateScreen> {
  final _controller = Get.put(CertificatesController());

  @override
  void initState() {
    _controller.loadAllTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<CertificatesController>(
      CertificatesController(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'hr_certificates'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoadingTypes.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.primaryRedColor,
                ),
              )
            : controller.typesList.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.all(10),
                    child: ListView.separated(
                        itemCount: controller.typesList.length,
                        itemBuilder: (listContext, index) {
                          var type = controller.typesList[index];
                          return SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  AppColor.primaryRedColor,
                                ),
                              ),
                              onPressed: () async {
                                final file = await controller
                                    .loadHrCertificatePdf(type.hrCertificateId);
                                if (file != null) {
                                  openPdf(context, file);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  type.certificateNameEN ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10)))
                : Center(
                    child: Text('Hr certificates is empty'.tr),
                  ),
      ),
    );
  }
}

void openPdf(BuildContext context, File file) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PdfViewerPage(file: file)));
}
