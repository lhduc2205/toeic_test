import 'package:flutter/material.dart';

class OpacityAnimation extends StatelessWidget {
  const OpacityAnimation({
    Key? key,
    required this.child,
    this.duration,
    this.direction,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final Duration? duration;
  final AxisDirection? direction;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration ?? const Duration(milliseconds: 500),
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child: Padding(
            padding: getPadding(val, direction: direction),
            child: child,
          ),
        );
      },
      tween: Tween<double>(begin: 0, end: 1),
      child: child,
    );
  }

  EdgeInsetsGeometry getPadding(double val, {AxisDirection? direction}) {
    switch (direction) {
      case AxisDirection.up:
        return EdgeInsets.only(bottom: val * (padding ?? 1));
      case AxisDirection.down:
        return EdgeInsets.only(top: val * (padding ?? 1));
      case AxisDirection.right:
        return EdgeInsets.only(left: val * (padding ?? 1));
      case AxisDirection.left:
        return EdgeInsets.only(right: val * (padding ?? 1));
      default:
        return EdgeInsets.zero;
    }
  }
}
