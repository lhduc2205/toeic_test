import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    this.radius,
    this.bgColor,
    this.splashColor,
    this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final double? radius;
  final Color? bgColor;
  final Color? splashColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(radius ?? 30.h, radius ?? 30.h),
      child: ClipOval(
        child: Material(
          color: bgColor ?? Colors.transparent,
          child: InkWell(
            splashColor: splashColor ?? Theme.of(context).splashColor,
            onTap: onPressed ?? () {},
            child: icon,
          ),
        ),
      ),
    );
  }
}
