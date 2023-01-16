import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, Color color, FontWeight fontWeight) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// Light Style

TextStyle getLightTextStyle(
    {double? fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize!, FontConstant.fontFamily, color, FontWeightManager.regular);
}

// Regular Style

TextStyle getRegularTextStyle(
    {double? fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(
      fontSize!, FontConstant.fontFamily, color, FontWeightManager.regular);
}

// Medium Style

TextStyle getMediumTextStyle(
    {double? fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(
      fontSize!, FontConstant.fontFamily, color, FontWeightManager.medium);
}

// Bold Style

TextStyle getBoldTextStyle(
    {double? fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(
      fontSize!, FontConstant.fontFamily, color, FontWeightManager.bold);
}
