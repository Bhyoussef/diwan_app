import 'package:flutter/material.dart';

class TopAndBottomTextureWrapper extends StatelessWidget {
  const TopAndBottomTextureWrapper(
      {Key? key, required this.child, this.isTopEnabled = true})
      : super(key: key);
  final Widget child;
  final bool isTopEnabled;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isTopEnabled)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/splashBackgroundTextureTop.png'),
          ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset('assets/images/splashBackgroundTextureBottom.png'),
        ),
      ],
    );
  }
}
