
import 'package:flutter/material.dart';

class OpacityAnimation extends StatelessWidget {
  const OpacityAnimation({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child: child,
        );
      },
      tween: Tween<double>(begin: 0, end: 1),
      child: child,
    );
  }
}