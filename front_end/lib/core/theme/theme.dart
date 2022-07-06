import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  static ThemeData basic(BuildContext context) => ThemeData(
        // primaryColorDark: kFontColorPallets[0],
        primaryColorDark: AppColor.primary,
        // primaryColor: const Color.fromRGBO(128, 109, 255, 1),
        // primaryColor: kFontColorPallets[0],
        primaryColor: AppColor.primary,
        // primaryColorLight: const Color.fromRGBO(159, 84, 252, 1),
        brightness: Brightness.light,
        // primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: AppColor.black, fontSizeFactor: 1.sp),
        iconTheme: IconThemeData(color: AppColor.normalText, size: 16.sp),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColor.primary,
          ).merge(
            ButtonStyle(
              elevation: MaterialStateProperty.all(0),
            ),
          ),
        ),
        // canvasColor: AppColor.primary,
        scaffoldBackgroundColor: AppColor.white,
      );
}

TextStyle titleTextStyle({Color? color, double? fontSize}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: fontSize ?? 25.sp,
      color: color ?? AppColor.primary,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle titleCardStyle({Color? color, double? fontSize}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: fontSize ?? 16.sp,
      color: color ?? AppColor.black,
      fontWeight: FontWeight.w700,
    ),
  );
}

TextStyle subTitleCardStyle({Color? color, double? fontSize}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: fontSize ?? 13.sp,
      color: color ?? AppColor.normalText,
    ),
  );
}

TextStyle smallTextStyle({Color? color}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: 12.sp,
      color: color ?? AppColor.normalText,
    ),
  );
}

TextStyle normalTextStyle({Color? color, FontWeight? fontWeight, double? fontSize}) {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontSize: fontSize ?? 14.sp,
      color: color ?? AppColor.normalText,
      fontWeight: fontWeight ?? FontWeight.normal,
    ),
  );
}

TextStyle get appTextStyle => GoogleFonts.montserrat(
      textStyle: TextStyle(
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
      fontSize: fontSize ?? 16.sp,
      color: color ?? AppColor.white,
      fontWeight: fontWeight ?? FontWeight.bold,
    ),
  );
}
