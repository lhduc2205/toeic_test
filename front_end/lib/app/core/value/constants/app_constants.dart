library app_constants;

import 'package:flutter/material.dart';

part 'api_path.dart';
part 'assets_path.dart';
part 'string_constants.dart';

class AppStyle {
  static const defaultBorderRadius = 15.0;
  static const defaultSpacing = 20.0;
}

class AppColor {
  static const primary = Color(0xFF0067FF);
  static const lavenderBlue = Color(0xFFC4DBFA);
  static const cultured = Color(0xFFF7F7F7);
  static const sonicSilver = Color(0xFF757575);
  static const white = Colors.white;
  static const black = Color(0xFF202124);

  static const normalText = Color(0xFF949DAD);

  static const inputFill = Color(0xFFF4F7FF);
  static const subTextWhite = Color(0xFFF1F1F1);

  static const primaryGradientColor =
  LinearGradient(begin: Alignment.topLeft, end: Alignment.center, colors: [
    Color(0xFF0067FF),
    Color(0xFF008FFD),
  ]);
}


