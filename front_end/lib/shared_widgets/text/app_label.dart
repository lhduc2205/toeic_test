import 'package:flutter/material.dart';
import 'package:front_end/core/value/theme/theme.dart';

import '../../core/value/constants/app_constants.dart';

class AppLabel extends StatelessWidget {
  const AppLabel({
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
        fontSize: AppStyle.titleListSize,
      ),
    );
  }
}
