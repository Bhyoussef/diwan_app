import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PadiwanTextField extends StatelessWidget {
  const PadiwanTextField({
    Key? key,
    this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    required this.controller,
    this.obscureText = false,
    this.digitsOnly = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
  }) : super(key: key);
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool obscureText;
  final bool digitsOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction,
        obscureText: obscureText,
        cursorHeight: 20,
        cursorWidth: 1.0,
        keyboardType: textInputType,
        inputFormatters:
            digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
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
          hintText: hintText ?? '',
          contentPadding: const EdgeInsets.only(
            top: 18.8,
            bottom: 17.2,
            left: 12,
            right: 12,
          ),
          fillColor: AppColor.primaryGreyColor,
          focusColor: AppColor.primaryGreyColor,
          prefixIcon: prefixWidget != null
              ? IconButton(icon: prefixWidget!, onPressed: () {})
              : null,
          suffixIcon: suffixWidget != null
              ? IconButton(icon: suffixWidget!, onPressed: () {})
              : null,
        ),
      ),
    );
  }
}

final textFieldDefaultBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: const BorderSide(color: Colors.transparent, width: 0),
);
