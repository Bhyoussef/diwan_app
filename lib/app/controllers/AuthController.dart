import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final AuthService _authService = AuthService();
  var isLoading = false.obs;

  final loginFormKey = GlobalKey<FormState>();

  String phoneNumber = '', password = '';
  var qidController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void onInit() {
    qidController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  String? validatePassword(String value) {
    if (GetUtils.isNull(value)) {
      return 'Please enter your password'.tr;
    } else if (GetUtils.isLengthLessOrEqual(value, 6)) {
      return 'Password is too short'.tr;
    } else {
      return null;
    }
  }

  login() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    isLoading(true);

    _authService
        .login(
      qid: qidController.text,
      password: passwordController.text,
    )
        .then(
      (auth) {
        if (auth) {
          Get.offAllNamed(AppRoutes.homeScreen);
        } else {
          Get.snackbar(
            'Login Error'.tr,
            'Invalid phone or password'.tr,
            colorText: Colors.white,
            backgroundColor: Colors.red,
          );
        }
        isLoading(false);
      },
    );

    loginFormKey.currentState!.save();
  }

  @override
  void dispose() {
    qidController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
