import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedAvatar extends StatelessWidget {
  const RoundedAvatar({
    Key? key,
    required this.image,
    this.radius,
    this.size,
    this.splashColor,
    this.onTap,
  }) : super(key: key);

  final String image;
  final double? radius;
  final double? size;
  final Color? splashColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius ?? 8.sp),
      splashColor: splashColor ?? Colors.white.withOpacity(0.3),
      onTap: onTap,
      child: Ink(
        width: size ?? 30.w,
        height: size ?? 30.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8.sp),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
