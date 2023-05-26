import 'package:diwanapp/app/controllers/LeaveController.dart';
import 'package:diwanapp/app/helpers/keyboard.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/widgets/PadawinButton.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  final _controller = Get.put(LeaveController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){


      _controller.leaveMasterList.clear();
      _controller.loadAllLeaveMasters();

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'leave_request'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => KeyboardUtil.hideKeyboard(context),
        child: Container(
          color: Colors.white,
          child: Obx(
            () => _controller.isLoadingMaster.isTrue
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColor.primaryRedColor,
                    ),
                  )
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                KeyboardUtil.hideKeyboard(context);
                                Get.bottomSheet(
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView.builder(
                                        controller:
                                            _controller.scrollController,
                                        itemCount:
                                            _controller.leaveMasterList.length,
                                        itemBuilder: (listContext, index) {
                                          var item = _controller
                                              .leaveMasterList[index];
                                          return RadioListTile<int>(
                                            title: Text(item.nameEng),
                                            value: index,
                                            groupValue: null,
                                            onChanged: (value) {
                                              KeyboardUtil.hideKeyboard(
                                                  context);
                                              _controller
                                                  .changeMasterSelected(item);
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  isDismissible: true,
                                  enableDrag: false,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 242, 242, 242),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    child: Row(
                                      children: [
                                        _controller.slectedLeaveId != ''
                                            ? Text(
                                                _controller
                                                    .selectedMaster.nameEng,
                                                style: const TextStyle(
                                                  color: Color(0xFF787A87),
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 18,
                                                ),
                                              )
                                            : Text(
                                                'leave_master'.tr,
                                                style: const TextStyle(
                                                  color: Color(0xFF787A87),
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 18,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 242, 242, 242),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${'available_leave_days'.tr}: ',
                                        style: const TextStyle(
                                          color: Color(0xFF787A87),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                        ),
                                      ),
                                      _controller.slectedLeaveId != ''
                                          ? Text(
                                              _controller.selectedMaster
                                                      .maxAllowedDays
                                                      .toString() +
                                                  ' day'.tr,
                                              style: const TextStyle(
                                                color: Color(0xFF787A87),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              // controller: controller.qidController,
                              cursorHeight: 20,
                              cursorWidth: 1.0,
                              keyboardType: TextInputType.text,
                              cursorColor: AppColor.primaryRedColor,
                              onFieldSubmitted: (s) {
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: InputDecoration(
                                enabledBorder: textFieldDefaultBorder,
                                focusedBorder: textFieldDefaultBorder,
                                border: textFieldDefaultBorder,
                                filled: true,
                                hintStyle: const TextStyle(
                                  color: Color(0xFF787A87),
                                  fontWeight: FontWeight.w300,
                                ),
                                hintText: 'start_date'.tr,
                                contentPadding: const EdgeInsets.only(
                                  top: 18.8,
                                  bottom: 17.2,
                                  left: 12,
                                  right: 12,
                                ),
                                fillColor: AppColor.primaryGreyColor,
                                focusColor: AppColor.primaryGreyColor,
                                prefixIcon: IconButton(
                                    icon: Image.asset(
                                      'assets/images/home_services_icons/attendance_icon.png',
                                      width: 25,
                                      height: 20,
                                    ),
                                    onPressed: () {}),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              // controller: controller.qidController,
                              cursorHeight: 20,
                              cursorWidth: 1.0,
                              keyboardType: TextInputType.text,
                              cursorColor: AppColor.primaryRedColor,
                              onFieldSubmitted: (s) {
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: InputDecoration(
                                enabledBorder: textFieldDefaultBorder,
                                focusedBorder: textFieldDefaultBorder,
                                border: textFieldDefaultBorder,
                                filled: true,
                                hintStyle: const TextStyle(
                                  color: Color(0xFF787A87),
                                  fontWeight: FontWeight.w300,
                                ),
                                hintText: 'end_date'.tr,
                                contentPadding: const EdgeInsets.only(
                                  top: 18.8,
                                  bottom: 17.2,
                                  left: 12,
                                  right: 12,
                                ),
                                fillColor: AppColor.primaryGreyColor,
                                focusColor: AppColor.primaryGreyColor,
                                prefixIcon: IconButton(
                                    icon: Image.asset(
                                      'assets/images/home_services_icons/attendance_icon.png',
                                      width: 25,
                                      height: 20,
                                    ),
                                    onPressed: () {}),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 242, 242, 242),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Row(
                                    children: [
                                      Text(
                                        'leave_days'.tr,
                                        style: const TextStyle(
                                          color: Color(0xFF787A87),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              // controller: controller.qidController,
                              cursorHeight: 20,
                              cursorWidth: 1.0,
                              cursorColor: AppColor.primaryRedColor,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (s) {},
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              decoration: InputDecoration(
                                enabledBorder: textFieldDefaultBorder,
                                focusedBorder: textFieldDefaultBorder,
                                border: textFieldDefaultBorder,
                                filled: true,
                                hintStyle: const TextStyle(
                                  color: Color(0xFF787A87),
                                  fontWeight: FontWeight.w300,
                                ),
                                hintText: 'remarks'.tr,
                                contentPadding: const EdgeInsets.only(
                                  top: 18.8,
                                  bottom: 17.2,
                                  left: 18,
                                  right: 18,
                                ),
                                fillColor: AppColor.primaryGreyColor,
                                focusColor: AppColor.primaryGreyColor,
                              ),
                            ),
                            const SizedBox(height: 20),
                            PadiwanButton(
                              onPressed: () {
                                () {};
                              },
                              isLoading: false,
                              text: 'send_request'.tr,
                              width: double.infinity,
                              buttonType: ButtonType.blue,
                              height: 58,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

final textFieldDefaultBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: const BorderSide(color: Color.fromARGB(0, 65, 20, 20), width: 0),
);
