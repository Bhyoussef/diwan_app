import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/LoanController.dart';
import '../../../../helpers/keyboard.dart';
import '../../../../theme/app_colors.dart';
import '../../../../widgets/PadawinButton.dart';
import '../../../../widgets/PadiwanTextField.dart';

class LoanRequestScreen extends StatefulWidget {
  const LoanRequestScreen({super.key});

  @override
  State<LoanRequestScreen> createState() => _LoanRequestScreenState();
}

class _LoanRequestScreenState extends State<LoanRequestScreen> {
  final _controller = Get.put(LoanController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _controller.loanTypesList.clear();
      _controller.loadAllLoanTypes();
    });

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'loan_request'.tr,
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
                () => _controller.isLoadingLoanTypes.isTrue
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                  _controller.loanTypesList.length,
                                  itemBuilder: (listContext, index) {
                                    var item = _controller
                                        .loanTypesList[index];
                                    return RadioListTile<int>(
                                      title: Text(item.name),
                                      value: index,
                                      groupValue: null,
                                      onChanged: (value) {
                                        KeyboardUtil.hideKeyboard(
                                            context);
                                        _controller
                                            .changeLoanTypeSelected(item);
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
                                  _controller.selectedLoanTypeId != ''
                                      ? Text(
                                    _controller
                                        .selectedLoanType.name,
                                    style: const TextStyle(
                                      color: Color(0xFF787A87),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                    ),
                                  )
                                      : Text(
                                    'Loan Type'.tr,
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
                      _controller.initial.isFalse &&  _controller.selectedLoanTypeId == ""?
                      const Text("Select loan type",style: TextStyle(color: Colors.red),)
                      :const SizedBox(),




                       SizedBox(height: _controller.initial.isTrue ?  20 : 10 ),
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
                                  '${'Max allowed'.tr}: ',
                                  style: const TextStyle(
                                    color: Color(0xFF787A87),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18,
                                  ),
                                ),
                                _controller.selectedLoanTypeId != ''
                                    ? Text(
                                  _controller.selectedLoanType
                                      .maxAllowed
                                      .toString() ,
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
                            fontSize: 18,
                          ),
                          hintText: 'Requested Amount'.tr,
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

                      _controller.initial.isFalse &&  _controller.requestedAmountController.text.isEmpty ?
                      const Text("Enter your requested amount",style: TextStyle(color: Colors.red)) :
                      _controller.requestedAmountController.text.isNotEmpty &&  double. parse(_controller.requestedAmountController.text)  > _controller.selectedLoanType.maxAllowed?
                      Text("${'Max allowed'.tr} ${_controller.selectedLoanType.maxAllowed}",style: const TextStyle(color: Colors.red)) :
                      const SizedBox(),
                      SizedBox(height: _controller.initial.isTrue ?  20 : 10 ),
                      InkWell(
                        onTap: () {
                          KeyboardUtil.hideKeyboard(context);
                          Get.bottomSheet(
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  controller: _controller.scrollController,
                                  itemCount: _controller.numberOfInstallmentList.length,
                                  itemBuilder: (listContext, index) {
                                    var item = _controller.numberOfInstallmentList[index];
                                    return RadioListTile<int>(
                                      title: Text(item.toString()),
                                      value: index,
                                      groupValue: null,
                                      onChanged: (value) {
                                        KeyboardUtil.hideKeyboard(context);
                                        _controller.selectedNumberOfInstallment = item.toString();
                                        _controller.update();

                                        Navigator.of(context).pop();
                                        setState(() {

                                        });
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
                                  _controller.selectedNumberOfInstallment == ''
                                      ? Text(
                                    "No of Installment".tr,
                                    style: const TextStyle(
                                      color: Color(0xFF787A87),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                    ),
                                  ) : Text(
                                    _controller.selectedNumberOfInstallment,
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


                      _controller.initial.isFalse &&  _controller.selectedNumberOfInstallment == "" ?
                      const Text("Choose the number of installment",style: TextStyle(color: Colors.red),) :
                      const SizedBox(),
                      SizedBox(height: _controller.initial.isTrue ?  20 : 10 ),
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
                          _controller.saveLoanRequest();
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
