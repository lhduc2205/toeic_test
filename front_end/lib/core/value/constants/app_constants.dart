library app_constants;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'api_path.dart';

part 'assets_path.dart';

part 'string_constants.dart';

class AppStyle {
  AppStyle._();

  static  double defaultBorderRadius = 15.sp;
  static  double defaultSpacing = 10.sp;
  static  double titleListSize = 18.sp;
  static  double titleAppSize = 25.sp;
}

class AppColor {
  AppColor._();

  static const primary = Color(0xFF0067FF);
  static const lightBlue = Color(0xFF39A2DB);
  static const lightBlue2 = Color(0xFF00A4FD);
  static const lavenderBlue = Color(0xFFC4DBFA);
  static const cultured = Color(0xFFF7F7F7);
  static const sonicSilver = Color(0xFF757575);
  static const lightGrey = Color(0xff7c94b6);
  static const white = Colors.white;
  static const white1 = Color(0xFFF2F2F2);
  static const black = Color(0xFF393E46);
  static const black1 = Color(0xFF2D4263);
  static const black2 = Color(0xFF51557E);
  static const red = Color(0xFFE33E5A);
  static const lightRed = Color(0xFFFF7F7F);
  static const orange = Color(0xFFF15412);
  static const lightOrange = Color(0xFFee6c4d);

  static const normalText = Color(0xFF797C80);

  static const inputFill = Color(0xFFF4F7FF);
  static const subTextWhite = Color(0xFFF1F1F1);

  static const primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0067FF),
      Color(0xFF00A4FD),
    ],
  );

  static const orangeGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFee6c4d),
      Color(0xFFF15412),
    ],
  );

  static const blackGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF2D4263),
      Color(0xFF51557E),
    ],
  );


  static const logoAppGradient = LinearGradient(
    colors: [
      Color(0xFF0067FF),
      Color(0xFFec008c),
    ],
  );
}
