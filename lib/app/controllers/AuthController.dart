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
      return 'password_required'.tr;
    } else if (GetUtils.isLengthLessOrEqual(value, 6)) {
      return 'password_length'.tr;
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    if (value == '') {
      return 'email_required'.tr;
    } else if (!GetUtils.isEmail(value)) {
      return 'is_email'.tr;
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
            'login_error'.tr,
            'invalid_phone_or_password'.tr,
            colorText: Colors.white,
            backgroundColor: Colors.black,
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
