import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/core/value/constants/app_constants.dart';

enum ButtonState { initial, loading, success }

class DefaultButton extends StatelessWidget {
  final Widget child;
  final bool isOutlinedButton;
  final VoidCallback? onPressed;
  final Color? primaryColor;
  final Color? borderColor;
  final Color? indicatorColor;
  final double? padding;
  final ButtonState buttonState;

  const DefaultButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.primaryColor,
    this.borderColor,
    this.indicatorColor,
    this.padding,
    this.isOutlinedButton = false,
    this.buttonState = ButtonState.initial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOutlinedButton ? _outlineButton() : _elevatedButton();
  }

  Widget _elevatedButton() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: primaryColor ?? AppColor.primary,
        // padding: EdgeInsets.all(padding ?? 15),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
        ),
      ),
      child: _buildChild(child),
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
          borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
        ),
        side: BorderSide(color: borderColor ?? AppColor.primary),
      ),
      child: _buildChild(child),
    );
  }

  Widget _buildChild(Widget widget) {
    if (buttonState == ButtonState.initial) {
      return widget;
    }
    else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(color: indicatorColor ?? AppColor.white),
          const SizedBox(width: 10),
          widget
        ],
      );
    }
  }
}

class _DefaultButtonWithOutlined extends StatelessWidget {
  const _DefaultButtonWithOutlined({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

