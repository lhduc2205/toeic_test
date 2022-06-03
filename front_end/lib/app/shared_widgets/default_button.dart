import 'package:flutter/material.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';

class DefaultButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? primaryColor;
  final Color? borderColor;
  final double? padding;
  final bool isOutlinedButton;

  const DefaultButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.primaryColor,
    this.borderColor,
    this.padding,
    this.isOutlinedButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOutlinedButton ? _outlineButton() : _elevatedButton();
  }

  Widget _elevatedButton() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: primaryColor ?? kPrimary,
        // padding: EdgeInsets.all(padding ?? 15),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),
      child: child,
    );
  }

  Widget _outlineButton() {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        primary: primaryColor ?? Colors.transparent,
        // padding: EdgeInsets.all(padding ?? 15),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        side: BorderSide(color: borderColor ?? kPrimary),
      ),
      child: child,
    );
  }
}
