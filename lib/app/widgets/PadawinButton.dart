import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/theme/theme_button.dart';
import 'package:flutter/material.dart';

enum ButtonType { white, red, blue }

class PadiwanButton extends StatelessWidget {
  final Function onPressed;
  final double? width;
  final bool? isLoading;
  final double? height;
  final String? text;
  final ButtonType? buttonType;
  final TextStyle? textStyle;
  const PadiwanButton(
      {required this.onPressed,
      this.isLoading = false,
      this.width = 125,
      this.height = 50,
      required this.text,
      this.buttonType = ButtonType.red,
      this.textStyle});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width!,
      height: height!,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: buttonType == ButtonType.red
            ? PadiwanButtonTheme.redButtonTheme.style
            : buttonType == ButtonType.blue
                ? PadiwanButtonTheme.blueButtonTheme.style
                : PadiwanButtonTheme.whiteButtonTheme.style,
        child: isLoading!
            ? const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text!,
                textAlign: TextAlign.center,
                style: textStyle ??
                    TextStyle(
                      // height: text!.contains('\n') ? 1.0 : null,
                      color: buttonType == ButtonType.white
                          ? AppColor.primaryBlueColor
                          : Colors.white,
                    ),
              ),
      ),
    );
  }
}
