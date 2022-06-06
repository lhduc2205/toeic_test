import 'package:flutter/material.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final IconData? suffixIcon;
  final String? suffixText;
  final String? prefixText;
  final IconData? prefixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Color? fillColor;
  final VoidCallback? onTap;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.label,
    this.suffixIcon,
    this.obscureText,
    this.suffixText,
    this.prefixText,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: label == null ? null : label!,
        hintText: hintText,
        suffixText: suffixText,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        prefixStyle: const TextStyle(
          color: kNormalText,
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(suffixIcon, color: kNormalText),
        ),
        fillColor: kInputFill,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kBorderRadius,
          ),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            kBorderRadius,
          ),
          borderSide: BorderSide(
              color: fillColor ?? kPrimary
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kPrimary
          ),
          borderRadius: BorderRadius.circular(
            kBorderRadius,
          ),
        ),
        contentPadding: const EdgeInsets.all(15),

      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
