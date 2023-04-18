import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/theme/theme_button.dart';
import 'package:diwanapp/app/widgets/TopAndBottomTextureWrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryRedColor,
      body: TopAndBottomTextureWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                height: 224,
                width: 224,
                child: Image.asset('assets/images/langPic.png')),
            const SizedBox(
              height: 45,
            ),
            const Text(
              'Choose your preferred language',
              style: TextStyle(
                fontFamily: 'Bahij',
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            const Text(
              'اختر لغتك المفضلة',
              style: TextStyle(
                fontFamily: 'Bahij',
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 37),
            const ButtonsRow(),
          ],
        ),
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 125,
          child: TextButton(
            onPressed: () {
              SharedData.saveToStorage('LANGUAGE', 'en', 'string');
              Get.updateLocale(const Locale('en', 'US'));
              Get.toNamed(AppRoutes.loginScreen);
            },
            style: PadiwanButtonTheme.whiteButtonTheme.style,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/ukFlag.png',
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 16),
                const Text(
                  'English',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColor.primaryBlueColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          height: 50,
          width: 125,
          child: TextButton(
            onPressed: () {
              SharedData.saveToStorage('LANGUAGE', 'ar', 'string');
              Get.updateLocale(const Locale('ar', 'AR'));
              Get.toNamed(AppRoutes.loginScreen);
            },
            style: PadiwanButtonTheme.blueButtonTheme.style,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'عربي',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 16),
                Image.asset(
                  'assets/images/qatarFlag.png',
                  width: 25,
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
