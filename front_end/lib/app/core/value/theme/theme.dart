import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_constants.dart';

class AppTheme {
  static ThemeData basic(BuildContext context) =>
      ThemeData(
        // primaryColorDark: kFontColorPallets[0],
        primaryColorDark: kPrimary,
        // primaryColor: const Color.fromRGBO(128, 109, 255, 1),
        // primaryColor: kFontColorPallets[0],
        primaryColor: kPrimary,
        // primaryColorLight: const Color.fromRGBO(159, 84, 252, 1),
        // brightness: Brightness.light,
        // primarySwatch: Colors.indigo,
        textTheme:
        GoogleFonts.nunitoSansTextTheme(Theme
            .of(context)
            .textTheme).apply(
          bodyColor: kBlack,
        ),
        iconTheme: const IconThemeData(color: kNormalText),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // primary: const Color.fromRGBO(128, 109, 255, 1),
            primary: kPrimary,
          ).merge(
            ButtonStyle(
              elevation: MaterialStateProperty.all(0),
            ),
          ),
        ),
        // canvasColor: const Color.fromRGBO(31, 29, 44, 1),
        scaffoldBackgroundColor: kWhite,
      );
}

TextStyle titleTextStyle({Color? color}) {
  return GoogleFonts.nunito(
      textStyle: TextStyle(
          fontSize: 25,
          color: color ?? kPrimary,
          fontWeight: FontWeight.bold
      ),
  );
}

TextStyle subTextStyle({Color? color}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
        fontSize: 14,
        color: color ?? kNormalText,
    ),
  );
}
