import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: AppColor.primaryBlueColor,
    inputDecorationTheme: inputDecorationTheme(),
    fontFamily: 'Bahij',
    colorScheme: Theme.of(context)
        .colorScheme
        .copyWith(primary: AppColor.primaryBlueColor)
        .copyWith(secondary: AppColor.primaryBlueColor),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: AppColor.primaryGreyColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
