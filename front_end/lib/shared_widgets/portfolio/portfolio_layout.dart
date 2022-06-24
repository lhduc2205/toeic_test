import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/value/constants/app_constants.dart';
import '../text/app_label.dart';

class PortfolioLayout extends StatelessWidget {
  const PortfolioLayout({
    Key? key,
    required this.label,
    required this.portfolio,
    this.icon,
    this.color,
    this.action,
  }) : super(key: key);

  final String label;
  final Widget portfolio;
  final IconData? icon;
  final Color? color;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Label(label, icon: icon, color: color),
              action ?? Container(),
            ],
          ),
          const SizedBox(height: 5),
          portfolio,
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(
    this.text, {
    Key? key,
    this.icon,
    this.color,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: icon != null,
          child: Icon(icon, color: color ?? AppColor.black1, size: AppStyle.titleListSize),
        ),
        Visibility(visible: icon != null, child: SizedBox(width: 5.w)),
        AppLabel(text: text, color: color ?? AppColor.black1),
      ],
    );
  }
}
