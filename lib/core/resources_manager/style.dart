import 'package:flutter/cupertino.dart';
import 'package:flymefy/core/resources_manager/font.dart';

//general style text func
TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: FontManager.fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight);
}

//regular text style
TextStyle getRegularStyle(
    {double fontSize = FontManager.fontSize12, required Color color}) {
  return _getTextStyle(fontSize, FontManager.regular, color);
}

//medium text style
TextStyle getMediumStyle(
    {double fontSize = FontManager.fontSize12, required Color color}) {
  return _getTextStyle(fontSize, FontManager.medium, color);
}

//bold text style
TextStyle getBoldStyle(
    {double fontSize = FontManager.fontSize12, required Color color}) {
  return _getTextStyle(fontSize, FontManager.bold, color);
}

//simaBold text style
TextStyle getSimaBoldStyle(
    {double fontSize = FontManager.fontSize12, required Color color}) {
  return _getTextStyle(fontSize, FontManager.simaBold, color);
}

//light text style
TextStyle getLightStyle(
    {double fontSize = FontManager.fontSize12, required Color color}) {
  return _getTextStyle(fontSize, FontManager.light, color);
}
