import 'package:flutter/material.dart';

import '../core/value/constants/app_constants.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.child,
    this.padding,
    this.radius,
    this.color,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius ?? 40),
        topRight: Radius.circular(radius ?? 40),
      ),
      child: Container(
        padding: padding ?? const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color ?? AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius ?? 40),
            topRight: Radius.circular(radius ?? 40),
          ),
        ),
        child: child,
      ),
    );
  }
}
