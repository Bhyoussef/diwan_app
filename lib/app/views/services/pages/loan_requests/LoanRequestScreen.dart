import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanRequestScreen extends StatelessWidget {
  const LoanRequestScreen({super.key});

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
      body: Container(),
    );
  }
}
