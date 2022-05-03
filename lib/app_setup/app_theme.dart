import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_android/common/constants/color_constants.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.backgroundColorWhite,
    appBarTheme: const AppBarTheme(
      color: ColorConstants.backgroundColorWhite,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.teal,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      subtitle2: TextStyle(
        color: Colors.white70,
        fontSize: 18,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      headline6: textStyle.copyWith(
        color: Colors.white,
        fontSize: 20,
      ),
      subtitle2: textStyle.copyWith(
        color: Colors.white70,
        fontSize: 18,
      ),
    ),
  );

  static TextStyle textStyle = GoogleFonts.philosopher();
}
