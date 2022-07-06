import 'package:flutter/material.dart';
import 'package:front_end/core/value/constants/app_constants.dart';

class ColoredChoiceChip extends StatelessWidget {
  const ColoredChoiceChip({
    Key? key,
    required this.label,
    this.primaryColor = AppColor.primary,
    this.isSelected = false,
    this.onSelected,
  }) : super(key: key);

  final String label;
  final Color primaryColor;
  final bool isSelected;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
      child: Material(
        color: isSelected ? primaryColor : primaryColor.withOpacity(0.08),
        child: InkWell(
          onTap: () {},
          highlightColor: Colors.transparent,
          splashColor: primaryColor.withOpacity(0.2),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppStyle.defaultSpacing,
              vertical: AppStyle.defaultSpacing / 2,
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
