import 'package:flutter/material.dart';
import 'package:front_end/core/value/constants/app_constants.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final IconData? suffixIcon;
  final String? suffixText;
  final String? prefixText;
  final String? errorText;
  final IconData? prefixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Color? fillColor;
  final VoidCallback? onTapSuffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.label,
    this.suffixIcon,
    this.obscureText,
    this.suffixText,
    this.prefixText,
    this.errorText,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.onTapSuffixIcon,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label == null ? null : label!,
        hintText: hintText,
        suffixText: suffixText,
        errorText: errorText,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        hintStyle: const TextStyle(
          color: AppColor.normalText,
        ),
        prefixStyle: const TextStyle(
          color: AppColor.normalText,
        ),
        suffixIcon: GestureDetector(
          onTap: onTapSuffixIcon,
          child: Icon(suffixIcon, color: AppColor.normalText),
        ),
        fillColor: AppColor.inputFill,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppStyle.defaultBorderRadius,
          ),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppStyle.defaultBorderRadius,
          ),
          borderSide: BorderSide(color: fillColor ?? AppColor.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primary,
          ),
          borderRadius: BorderRadius.circular(
            AppStyle.defaultBorderRadius,
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
