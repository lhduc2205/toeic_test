import 'package:flutter/material.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.onPressed,
    this.primary,
    required this.child,
  }) : super(key: key);

  final Function()? onPressed;
  final Color? primary;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: primary ?? kPrimary,
      ),
      child: child,
    );
  }
}
