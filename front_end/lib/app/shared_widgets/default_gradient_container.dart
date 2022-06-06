import 'package:flutter/material.dart';

import '../core/value/constants/app_constants.dart';

class DefaultGradientContainer extends StatelessWidget {
  const DefaultGradientContainer({
    Key? key,
    required this.child,
    this.gradient,
  }) : super(key: key);

  final Widget child;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient ?? kPrimaryGradientColor,
      ),
      child: child,
    );
  }
}
