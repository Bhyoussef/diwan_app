import 'package:flutter/material.dart';

import 'PadawinButton.dart';

class PadiwanGradientButton extends StatelessWidget {
  const PadiwanGradientButton({
    required this.onPressed,
    this.width = 125,
    this.height = 56,
    required this.text,
    this.buttonType = ButtonType.blue,
  });
  final Function onPressed;
  final double? width;
  final double? height;
  final String? text;
  final ButtonType? buttonType;
  @override
  Widget build(BuildContext context) {
    final gradientRedWithOpacity = const Color(0xff8A1538).withOpacity(0.62);
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: SizedBox(
        width: width!,
        height: height!,
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  colors: buttonType == ButtonType.blue
                      ? [Color(0xff548AB1), Color(0xff162553)]
                      : [gradientRedWithOpacity, Color(0xff8A1538)]),
            ),
            child: Center(
              child: Text(
                text!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
