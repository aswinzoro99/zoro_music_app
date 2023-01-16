import 'package:advanced_flutter_projexct/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';

import '../common/dimensions.dart';

const String kFontFamily = 'Poppins';
const double kLetterSpacing = 0.3;

ThemeData get lightTheme => ThemeData(
      applyElevationOverlayColor: false,
      backgroundColor: grey3,
      fontFamily: kFontFamily,
      brightness: Brightness.light,
      primaryTextTheme: TextTheme(
        displayLarge: TextStyle(
          color: white,
          fontSize: displayLarge,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        displayMedium: TextStyle(
          color: white,
          fontSize: displayMedium,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        displaySmall: TextStyle(
          color: white,
          fontSize: displaySmall,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        headlineLarge: TextStyle(
          color: white,
          fontSize: headlineLarge,
          fontWeight: FontWeight.w600,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        headlineMedium: TextStyle(
          color: white,
          fontSize: headlineMedium,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        headlineSmall: TextStyle(
          color: white,
          fontSize: headlineSmall,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        titleLarge: TextStyle(
          color: white,
          fontSize: titleLarge,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        titleMedium: TextStyle(
          color: white,
          fontSize: titleMedium,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        titleSmall: TextStyle(
          color: white,
          fontSize: titleSmall,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        bodyLarge: TextStyle(
          color: white,
          fontSize: bodyLarge,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        bodyMedium: TextStyle(
          color: white,
          fontSize: bodyMedium,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        bodySmall: TextStyle(
          color: white,
          fontSize: bodySmall,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        labelLarge: TextStyle(
          color: white,
          fontSize: labelLarge,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        labelMedium: TextStyle(
          color: white,
          fontSize: labelMedium,
          letterSpacing: kLetterSpacing,
          fontFamily: kFontFamily,
        ),
        labelSmall: TextStyle(
          color: white,
          fontSize: labelSmall,
          letterSpacing: kLetterSpacing,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
          horizontal: textFieldHorPadding,
          vertical: textFieldVerPadding,
        ),
        suffixIconColor: grey3,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: buttonBorderRadius,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: buttonBorderRadius,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: buttonBorderRadius,
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: buttonBorderRadius,
          borderSide: BorderSide.none,
        ),
        labelStyle: TextStyle(
          color: grey3,
          fontSize: sp13,
          fontWeight: FontWeight.w600,
          letterSpacing: kLetterSpacing,
        ),
        hintStyle: TextStyle(
          fontFamily: kFontFamily,
          fontSize: sp13,
          color: black,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: TextStyle(
          fontFamily: kFontFamily,
          fontSize: bodySmall,
          color: grey3,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        isDense: true,
        iconColor: primary,
        fillColor: white,
      ),
    );

final BorderRadius dialogButtonBorderRadius =
    BorderRadius.circular(dialogBtnCornerRadius);
final BorderRadius buttonBorderRadius = BorderRadius.circular(textFieldRadius);
