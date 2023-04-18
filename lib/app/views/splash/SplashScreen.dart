import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/widgets/TopAndBottomTextureWrapper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    pushNextScreen();
  }

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
              height: 158,
              width: 158,
              child: Image.asset('assets/images/qatarLogo.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'PADIWAN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontFamily: 'Bahij',
              ),
            ),
            const Text(
              'Version 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Bahij',
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pushNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed(AppRoutes.languagePickerScreen);
  }
}
