import 'package:flutter/material.dart';

import '../core/value/constants/app_constants.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.child,
    this.padding,
    this.radius,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(AppStyle.defaultSpacing),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius ?? 40),
          topRight: Radius.circular(radius ?? 40),
        ),
      ),
      child: child,
    );
  }
}
