import 'package:flutter/material.dart';
import 'package:front_end/core/value/constants/app_constants.dart';

class CustomCardOutlined extends StatelessWidget {
  const CustomCardOutlined({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
