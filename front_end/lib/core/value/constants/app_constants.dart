library app_constants;

import 'package:flutter/material.dart';

part 'api_path.dart';
part 'assets_path.dart';
part 'string_constants.dart';

class AppStyle {
  static const defaultBorderRadius = 15.0;
  static const defaultSpacing = 20.0;
  static const titleListSize = 22.0;
}

class AppColor {
  static const primary = Color(0xFF0067FF);
  static const lightBlue = Color(0xFF39A2DB);
  static const lavenderBlue = Color(0xFFC4DBFA);
  static const cultured = Color(0xFFF7F7F7);
  static const sonicSilver = Color(0xFF757575);
  static const white = Colors.white;
  static const black = Color(0xFF202124);
  static const black1 = Color(0xFF2D4263);
  static const black2 = Color(0xFF51557E);
  static const red = Color(0xFFE33E5A);
  static const lightRed = Color(0xFFFF7F7F);
  static const orange = Color(0xFFF15412);
  static const lightOrange = Color(0xFFee6c4d);

  static const normalText = Color(0xFF949DAD);

  static const inputFill = Color(0xFFF4F7FF);
  static const subTextWhite = Color(0xFFF1F1F1);

  static const primaryGradientColor =
  LinearGradient(begin: Alignment.topLeft, end: Alignment.center, colors: [
    Color(0xFF0067FF),
    Color(0xFF008FFD),
  ]);
}


