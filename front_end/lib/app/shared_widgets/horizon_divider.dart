import 'package:flutter/material.dart';

import '../core/value/constants/app_constants.dart';

class HorizonDivider extends StatelessWidget {
  const HorizonDivider({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColor.normalText,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(color: AppColor.normalText),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 1,
            color: AppColor.normalText,
          ),
        ),
      ],
    );
  }
}
