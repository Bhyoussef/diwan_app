import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SafeAreaRedTopWhiteBody extends StatelessWidget {
  const SafeAreaRedTopWhiteBody({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryRedColor,
      child: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: child,
        ),
      ),
    );
  }
}
