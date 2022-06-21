import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ThemeClass {
  static ThemeData light = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      primaryColor: Colors.red.shade900,
      secondaryHeaderColor: Colors.black,
      primaryTextTheme: const TextTheme(
          labelSmall: TextStyle(
            color: Colors.black,
          )),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.red.shade900,
      ));

  static ThemeData dark = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.red.shade900,
      secondaryHeaderColor: Colors.white,
      colorScheme: const ColorScheme.dark(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.red.shade900,
      ),
      primaryTextTheme: const TextTheme(
          labelSmall: TextStyle(
            color: Colors.white,
          )
      )
  );
}

TextStyle get customTitleStyle {
  return GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: customContextColor,
  );
}

TextStyle get customTextStyle {
  return GoogleFonts.bhuTukaExpandedOne(
    fontWeight: FontWeight.w400,
    color: customContextColor,
  );
}

Color get customContextColor {
  return Get.isDarkMode ? Colors.white : Colors.black;
}
