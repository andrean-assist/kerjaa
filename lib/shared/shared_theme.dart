import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SharedTheme {
  static const whiteColor = Color(0xFFFFFFFF);

  static final _primaryTextStyle = GoogleFonts.plusJakartaSans().fontFamily;
  // static final _secondaryTextStyle = GoogleFonts.openSans().fontFamily;

  static const thin = FontWeight.w100;
  static const extraLight = FontWeight.w200;
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraBold = FontWeight.w800;
  static const black = FontWeight.w900;

  static final _lightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF329ED8),
  );

  static final _darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF329ED8),
  );

  static const textBtnColor = Color(0xFF329ED8);
  static const filledBtnColor = Color(0xFF329ED8);
  static const lightIconColor = Color(0xFF94A3B8);
  static const secondaryTextColor = Color(0xFF334155);

  static const lightSuccessColor = Color.fromARGB(255, 21, 91, 83);
  static const darkSuccessColor = Color(0xFF249689);
  static const lightInfoColor = Color(0xFF1307B2);
  static const darkInfoColor = Color.fromARGB(255, 62, 49, 232);
  static const errorColor = Color(0xFFFF5963);
  static const warningColors = Color(0xFFF9CF58);
  static const darkWarningColor = Color.fromARGB(255, 255, 136, 10);
  static const lightWarningColor = Color(0xFFE57B09);

  static final successColor =
      Get.isDarkMode ? darkSuccessColor : lightSuccessColor;
  static final warningColor =
      Get.isDarkMode ? darkWarningColor : lightWarningColor;
  static final infoColor = Get.isDarkMode ? darkInfoColor : lightInfoColor;

  // static final _textThemeStyle = TextTheme(
  //   bodyLarge: TextStyle(fontFamily: _primaryTextStyle),
  //   bodyMedium: TextStyle(fontFamily: _primaryTextStyle),
  //   bodySmall: TextStyle(fontFamily: _primaryTextStyle),
  // );

  static ThemeData lightThemeMaterial = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
        // bodyLarge: TextStyle()
        ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        // padding: WidgetStatePropertyAll(
        //   EdgeInsets.symmetric(
        //     horizontal: 28,
        //     vertical: 16,
        //   ),
        // ),
        backgroundColor: filledBtnColor,
        foregroundColor: Colors.white,
        fixedSize: const Size.fromHeight(60),
        textStyle: const TextStyle(
          fontWeight: semiBold,
          fontSize: 16,
        ),
      ),
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(textBtnColor),
      ),
    ),
  );

  static final darkThemeMaterial = ThemeData(
    colorScheme: _darkColorScheme,
    // fontFamily: _primaryTextStyle,
    textTheme: GoogleFonts.plusJakartaSansTextTheme(),
  );

  // static final lightThemeCupertino = CupertinoThemeData(
  //   brightness: Brightness.light,
  //   primaryColor: _lightColorScheme.primary,
  //   scaffoldBackgroundColor: _lightColorScheme.onSurface,
  //   applyThemeToAll: true,
  // );

  // static final darkThemeCupertino = CupertinoThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: _darkColorScheme.primary,
  //   scaffoldBackgroundColor: _darkColorScheme.surface,
  //   applyThemeToAll: true,
  // );
}
