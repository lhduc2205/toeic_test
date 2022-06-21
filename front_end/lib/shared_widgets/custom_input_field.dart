import 'package:flutter/material.dart';
import 'package:front_end/core/value/constants/app_constants.dart';

class CustomInputField extends StatelessWidget {
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
    this.onTap,
    this.fillColor,
    this.suffixIconColor,
    this.onTapSuffixIcon,
    this.controller,
    this.keyboardType,
    this.readOnly,
    this.enabled,
  }) : super(key: key);

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
  final Function()? onTap;
  final Color? fillColor;
  final Color? suffixIconColor;
  final VoidCallback? onTapSuffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool? enabled;

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
          child: Icon(suffixIcon, color: suffixIconColor ?? AppColor.normalText),
        ),
        fillColor: AppColor.inputFill,
        filled: true,
        enabledBorder: getInputBorder(),
        border: getInputBorder(
          borderSide: BorderSide(color: fillColor ?? AppColor.primary),
        ),
        focusedBorder: getInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primary,
          ),
        ),
        disabledBorder: getInputBorder(),
        contentPadding: const EdgeInsets.all(15),
      ),
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      // showCursor: false,
      readOnly: readOnly ?? false,
      enabled: enabled ?? true,
    );
  }

  InputBorder getInputBorder({BorderSide? borderSide}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppStyle.defaultBorderRadius,
      ),
      borderSide: borderSide ?? BorderSide.none,
    );
  }
}
