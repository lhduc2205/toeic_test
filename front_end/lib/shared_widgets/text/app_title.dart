import 'package:flutter/material.dart';
import 'package:front_end/core/theme/theme.dart';

import '../../core/value/constants/app_constants.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: titleTextStyle(
        color: color ?? AppColor.black,
        fontSize: AppStyle.titleAppSize,
      ),
    );
  }
}
