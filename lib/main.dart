import 'package:diwanapp/app/env/environnments.dart';
import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_theme.dart';
import 'package:diwanapp/app/translation/app_translations.dart';
import 'package:diwanapp/app/utils/principal_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedData.clearStorage();
  setEnvironnment(Environnement.prod);

  SharedData.getFromStorage('EMPLOYEE_ID', 'string').then((id) async {
    print(id);
  });

  getRoutes();
}

void getRoutes() async {
  SharedData.getFromStorage('LANGUAGE', 'string').then(
    (language) async {
      if (language != null) {
        print(language);
        SharedData.getFromStorage('USER_TOKEN', 'string').then(
          (token) async {
            if (token != null) {
              runApp(
                DevicePreview(
                  enabled: false,
                  builder: (context) =>
                      MyApp(route: AppRoutes.homeScreen, language: language),
                ),
              );
            } else {
              runApp(
                DevicePreview(
                  enabled: false,
                  builder: (context) =>
                      MyApp(route: AppRoutes.loginScreen, language: language),
                ),
              );
            }
          },
        );
      } else {
        runApp(
          DevicePreview(
            enabled: false,
            builder: (context) => const MyApp(
                route: AppRoutes.languagePickerScreen, language: 'en'),
          ),
        );
      }
    },
  );
}

class MyApp extends StatelessWidget {
  final String route;
  final String language;

  const MyApp({
    Key? key,
    required this.route,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diwan',
      theme: appThemeData(context),
      translationsKeys: AppTranslation.translations,
      locale: language == 'ar'
          ? const Locale('ar', 'AR')
          : const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MonthYearPickerLocalizations.delegate
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      initialRoute: route,
      getPages: AppPages.pages,
    );
  }
}
