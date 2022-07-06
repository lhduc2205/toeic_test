import 'package:flutter/material.dart';
import 'package:front_end/core/theme/theme.dart';
import 'package:front_end/core/value/constants/app_constants.dart';

class DefaultChip extends StatelessWidget {
  const DefaultChip({Key? key, required this.label, this.fontSize}) : super(key: key);

  final String label;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: normalTextStyle(fontSize: fontSize, color: AppColor.bluePallets[2]),
      ),
      backgroundColor: AppColor.bluePallets[0],
    );
  }
}
