import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/EduAllowanceController.dart';
import '../../../../helpers/keyboard.dart';
import '../../../../theme/app_colors.dart';
import '../../../../widgets/PadawinButton.dart';
import '../../../../widgets/PadiwanTextField.dart';

class SchoolAllowanceRequestScreen extends StatefulWidget {
  const SchoolAllowanceRequestScreen({super.key});

  @override
  State<SchoolAllowanceRequestScreen> createState() => _SchoolAllowanceRequestScreenState();
}

class _SchoolAllowanceRequestScreenState extends State<SchoolAllowanceRequestScreen> {

  final _controller = Get.put(EduAllowanceController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _controller.eduAllowanceMasterList.clear();
      _controller.getEduAllowanceMastersList();

    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'school_allowance_request'.tr,
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
                () => _controller.isLoadingEduAllowanceMasterList.isTrue
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
                                  _controller.eduAllowanceMasterList.length,
                                  itemBuilder: (listContext, index) {
                                    var item = _controller
                                        .eduAllowanceMasterList[index];
                                    return RadioListTile<int>(
                                      title: Text(item.name),
                                      value: index,
                                      groupValue: null,
                                      onChanged: (value) {
                                        KeyboardUtil.hideKeyboard(
                                            context);
                                        _controller.changeEduAllowanceSelected(item);
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
                                  _controller.selectedEduAllowanceId != ''
                                      ? Text(
                                    _controller
                                        .selectedEduAllowance.name,
                                    style: const TextStyle(
                                      color: Color(0xFF787A87),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                    ),
                                  )
                                      : Text(
                                    'Select Edu Allowance'.tr,
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
                                _controller.selectedEduAllowanceId != ''
                                    ? Text(
                                  _controller.selectedEduAllowance
                                      .maxAllowed
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
                        onTap: () async {
                          var pickedDateDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 36500)),
                            locale: Get.locale.toString().contains('ar')
                                ? const Locale('ar', 'AR')
                                : const Locale('en', 'US'),
                          );
                          _controller.startDateController.text = pickedDateDate.toString().substring(0,10);
                          _controller.leaveDays = pickedDateDate!.difference(DateTime.now()).inDays + 1;
                          setState(() {

                          });
                        },
                        controller: _controller.startDateController,
                        cursorHeight: 20,
                        cursorWidth: 1.0,
                        readOnly:true,
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
                            hintText: 'TransDate'.tr,
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
                              onPressed: (){},
                            )
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
                                  _controller.leaveDays == -1 ?
                                  'leave_days'.tr :
                                      _controller.leaveDays.toString(),
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
                        controller: _controller.requestedAmountController,
                        cursorHeight: 20,
                        cursorWidth: 1.0,
                        cursorColor: AppColor.primaryRedColor,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (s) {},
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: textFieldDefaultBorder,
                          focusedBorder: textFieldDefaultBorder,
                          border: textFieldDefaultBorder,
                          filled: true,
                          hintStyle: const TextStyle(
                            color: Color(0xFF787A87),
                            fontWeight: FontWeight.w300,
                          ),
                          hintText: 'Request Amount'.tr,
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
                      TextFormField(
                        controller: _controller.remarksController,
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
                          _controller.saveEduAllowanceRequest();
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
