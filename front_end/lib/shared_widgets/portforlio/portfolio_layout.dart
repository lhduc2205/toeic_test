import 'package:flutter/material.dart';

import '../../core/value/constants/app_constants.dart';
import '../text/app_label.dart';

class PortfolioLayout extends StatelessWidget {
  const PortfolioLayout({
    Key? key,
    required this.portfolio,
    required this.label,
    this.icon,
    this.color,
    this.action,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final Widget portfolio;
  final Color? color;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Label(label, icon: icon, color: color),
            action ?? Container(),
          ],
        ),
        const SizedBox(height: 10),
        portfolio,
      ],
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
        Visibility(visible: icon != null, child: const SizedBox(width: 10)),
        AppLabel(text: text, color: color ?? AppColor.black1),
      ],
    );
  }
}
