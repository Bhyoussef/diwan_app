import 'package:diwanapp/app/controllers/AuthController.dart';
import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/widgets/BottomTextureOnly.dart';
import 'package:diwanapp/app/widgets/PadawinButton.dart';
import 'package:diwanapp/app/widgets/PadiwanTextField.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<SignInController>(SignInController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              Expanded(
                child: BottomTextureOnly(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TopRedSection(
                          size: size,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        'signin'.tr,
                                        style: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Bahij',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(height: 3),
                                      Text(
                                        'signin_tag'.tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Bahij',
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                    ],
                                  ),
                                  PadiwanTextField(
                                    controller: controller.qidController,
                                    hintText: 'qid'.tr,
                                    textInputType: TextInputType.text,
                                    digitsOnly: false,
                                    prefixWidget: Image.asset(
                                      'assets/images/qidIcon.png',
                                      width: 19,
                                      height: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  PadiwanTextField(
                                    controller: controller.passwordController,
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                    hintText: 'password'.tr,
                                    prefixWidget: Image.asset(
                                      'assets/images/passwordIcon.png',
                                      width: 13,
                                      height: 19,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(AppRoutes.homeScreen),
                                    child: Stack(
                                      children: [
                                        PadiwanButton(
                                          onPressed: () {
                                            controller.login();
                                          },
                                          text: 'signin_btn'.tr,
                                          width: size.width,
                                          height: 58,
                                        ),
                                        Positioned(
                                          right: 0,
                                          width: 58,
                                          height: 58,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColor.primaryBlueColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 27,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopRedSection extends StatelessWidget {
  final Size size;

  const TopRedSection({super.key, required this.size});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Container(
        color: AppColor.primaryRedColor,
        height: 380,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 55,
              height: 389 / 2.3,
              child: SizedBox(
                height: 156,
                width: 156,
                child: Image.asset('assets/images/qatarLogo.png'),
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/loginBackground.png',
                    width: size.width,
                    alignment: Alignment.bottomCenter,
                    height: 165,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
