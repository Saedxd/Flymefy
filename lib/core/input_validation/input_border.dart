import 'package:flutter/material.dart';
import 'package:flymefy/core/resources_manager/color.dart';
import 'package:flymefy/core/resources_manager/values.dart';

OutlineInputBorder getInputBorder(
        {double borderRaduis = AppSize.appSize8,
        Color colorBorder = const Color(0xFFD7D5D7),
        double widthBorder = AppSize.appSize1}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRaduis)),
      borderSide: BorderSide(color: colorBorder, width: widthBorder),
    );

OutlineInputBorder getInputBorderError({
  double borderRadius = AppSize.appSize8,
  Color colorBorder = const Color.fromARGB(255, 244, 67, 54),
  double widthBorder = AppSize.appSize1,
}) =>
    OutlineInputBorder(
      borderSide: BorderSide(color: colorBorder, width: widthBorder),
    );

//hint style
TextStyle getHintStyle(
        {bool isEnglish = false,
        Color colorHint = ColorManager.hintColor,
        double fontSizeHint = AppSize.appSize16,
        FontWeight fontWeightHint = FontWeight.w500}) =>
    TextStyle(
      fontFamily: "AirbnbCereal",
      color: colorHint.withOpacity(AppSize.appSize0_70),
      fontSize: fontSizeHint,
      fontWeight: fontWeightHint,
    );

//text style
TextStyle getTextStyle(
        {bool isEnglish = false,
        Color colorText = ColorManager.blackColor,
        double fontSizeText = AppSize.appSize16,
        FontWeight fontWeightText = FontWeight.w500}) =>
    TextStyle(
      fontFamily: "AirbnbCereal",
      color: colorText,
      fontSize: fontSizeText,
      fontWeight: fontWeightText,
    );

//error style
TextStyle getErrorStyle(
        {bool isEnglish = false,
        Color colorError = ColorManager.redColor,
        double fontSizeError = AppSize.appSize14,
        TextOverflow overflow = TextOverflow.ellipsis,
        FontWeight fontWeightError = FontWeight.w400}) =>
    TextStyle(
      color: colorError,
      fontSize: fontSizeError,
      fontFamily: "AirbnbCereal",
      fontWeight: fontWeightError,
    );
