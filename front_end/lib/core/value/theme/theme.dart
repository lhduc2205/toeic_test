import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_constants.dart';

class AppTheme {
  static ThemeData basic(BuildContext context) => ThemeData(
        // primaryColorDark: kFontColorPallets[0],
        primaryColorDark: AppColor.primary,
        // primaryColor: const Color.fromRGBO(128, 109, 255, 1),
        // primaryColor: kFontColorPallets[0],
        primaryColor: AppColor.primary,
        // primaryColorLight: const Color.fromRGBO(159, 84, 252, 1),
        // brightness: Brightness.light,
        // primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: AppColor.black,
        ),
        iconTheme: const IconThemeData(color: AppColor.normalText),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // primary: const Color.fromRGBO(128, 109, 255, 1),
            primary: AppColor.primary,
          ).merge(
            ButtonStyle(
              elevation: MaterialStateProperty.all(0),
            ),
          ),
        ),
        // canvasColor: const Color.fromRGBO(31, 29, 44, 1),
        scaffoldBackgroundColor: AppColor.white,
      );
}

TextStyle titleTextStyle({Color? color, double? fontSize}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: fontSize ?? 25,
      color: color ?? AppColor.primary,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle titleCardStyle({Color? color, double? fontSize}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: fontSize ?? 16,
      color: color ?? AppColor.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle subTitleCardStyle({Color? color, double? fontSize}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: fontSize ?? 13,
      color: color ?? AppColor.normalText,
    ),
  );
}

TextStyle subTextStyle({Color? color}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: 14,
      color: color ?? AppColor.normalText,
    ),
  );
}

TextStyle normalTextStyle({Color? color, FontWeight? fontWeight, double? fontSize}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: fontSize ?? 16,
      color: color ?? AppColor.normalText,
      fontWeight: fontWeight ?? FontWeight.normal,
    ),
  );
}

TextStyle get appTextStyle => GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: AppStyle.titleAppSize,
        fontWeight: FontWeight.bold,
      ),
    );

TextStyle buttonTextStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: fontSize ?? 16,
      color: color ?? AppColor.white,
      fontWeight: fontWeight ?? FontWeight.bold,
    ),
  );
}
